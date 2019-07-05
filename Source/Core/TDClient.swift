//
//  TGClient.swift
//  Swiftygram
//
//  Created by KY1VSTAR on 5/16/19.
//  Copyright © 2019 KY1VSTAR. All rights reserved.
//

import Foundation
import tdjson

final public class TDClient {
    
    private let client = td_json_client_create()
    private let executionQueue = DispatchQueue(label: "TDClient.executionQueue", qos: .background, attributes: .concurrent)
    private let runLoopQueue = DispatchQueue(label: "TDClient.runLoopQueue")
    
    private let queryLock = MutexLock()
    private var completionHandlers = [UInt64: TDDataResultHandler]()
    private var nextQueryId: UInt64 = 0
    
    private let updateLock = MutexLock()
    private var updateHandlers = [HashableType: UpdateObserverInfo]()
    private var anyUpdateHandlers = [UInt64: UpdateHandler]()
    private var anyUpdateNextId: UInt64 = 0
    
    var authorizationStateObservation: TDCancellable?
    public let internalAuthorizationState = TDSubject<TDEnum.AuthorizationState?>(nil)
    
    public init() {
        authorizationStateObservation = observeUpdates(for: TDObject.UpdateAuthorizationState.self, updateHandler: { [weak self] update in
            self?.internalAuthorizationState.value = update.authorizationState
        })
        
        start()
    }
    
    deinit {
        td_json_client_destroy(client)
    }
    
    /**
     Sends a request to the TDLib.
     
     - Parameter function:
     */
    public func execute<Function>(_ function: Function, completionHandler: TDResultHandler<Function.ReturnType>? = nil) where Function: TDFunctionProtocol {
        executionQueue.async {
            var queryId: UInt64?
            var responseHandler: TDDataResultHandler?

            // response parser
            if let completionHandler = completionHandler {
                responseHandler = { result in
                    switch result {
                    case .success(let data):
                        do {
                            let object = try JSONDecoder.swiftygram.decode(Function.ReturnType.self, from: data)
                            
                            completionHandler(.success(object))
                        } catch {
                            completionHandler(.failure(.decoding(error)))
                        }
                        
                    case .failure(let error):
                        completionHandler(.failure(error))
                    }
                }
                
                queryId = self.pushCompletionHandler(responseHandler!)
            }
            
            // encoding and executing
            let wrappedFunction = FunctionWrapper(function: function, queryId: queryId)
            
            do {
                let data = try JSONEncoder.swiftygram.encode(wrappedFunction)
                
                self.send(data: data)
                
            } catch {
                if let queryId = queryId, let completionHandler = self.completionHandler(for: queryId) {
                    completionHandler(.failure(.encoding(error)))
                }
            }
        }
    }
    
    private func send(data: Data) {
        var data = data
        
        data.append(0)
        
        data.withUnsafeBytes({
            td_json_client_send(self.client, $0)
        })
    }
    
    // MARK: - Run loop
    private func start() {
        runLoopQueue.async { [weak self] in
            while let self = self {
                guard let result = td_json_client_receive(self.client, 10) else { continue }

                let string = String(cString: result)

                self.executionQueue.async {
                    guard let data = string.data(using: .utf8) else { return }
                    
                    self.processData(data)
                }
            }
        }
    }
    
    // MARK: - Update observation
    public func observeUpdates<Update>(for update: Update.Type, updateHandler: @escaping ((Update) -> ())) -> TDCancellable where Update: TDObject.Update {
        updateLock.lock(); defer { updateLock.unlock() }
        
        let hashableType = HashableType(Update.self)
        
        if updateHandlers[hashableType] == nil {
            updateHandlers[hashableType] = (0, [:])
        }
        
        let id = updateHandlers[hashableType]!.nextId
        updateHandlers[hashableType]!.nextId += 1
        updateHandlers[hashableType]!.handlers[id] = { update in
            if let update = update as? Update {
                updateHandler(update)
            }
        }
        
        return TDCancellable { [weak self] in
            guard let self = self else { return }
            
            self.updateLock.lock(); defer { self.updateLock.unlock() }
            
            self.updateHandlers[hashableType]?.handlers[id] = nil
        }
    }
    
    public func observerUpdates(with updateHandler: @escaping ((TDObject.Update) -> ())) -> TDCancellable {
        updateLock.lock(); defer { updateLock.unlock() }
        
        let id = anyUpdateNextId
        anyUpdateNextId += 1
        anyUpdateHandlers[id] = { update in
            updateHandler(update)
        }
        
        return TDCancellable { [weak self] in
            guard let self = self else { return }
            
            self.updateLock.lock(); defer { self.updateLock.unlock() }
            
            self.anyUpdateHandlers[id] = nil
        }
    }
    
    // MARK: - Data processing
    private func processData(_ data: Data) {
        let response: TDLibResponse
        
        do {
            response = try JSONDecoder.swiftygram.decode(TDLibResponse.self, from: data)
        } catch {
            print("Error while processing response: \(error)")
            return
        }
        
        if let type = response.type, type.hasPrefix("update") {
            processUpdate(data)
            return
        }
        
        guard let queryId = response.queryId,
            let completionHandler = self.completionHandler(for: queryId) else {
                return
        }
        
        if response.type == TDObject.Error.type {
            do {
                let error = try JSONDecoder.swiftygram.decode(TDObject.Error.self, from: data)

                completionHandler(.failure(.tdLib(error)))
            } catch {
                completionHandler(.failure(.decoding(error)))
            }

            return
        }
        
        completionHandler(.success(data))
    }
    
    // MARK: - Update processing
    private func processUpdate(_ data: Data) {
        let updateObject: TDObject.Update
        
        do {
            updateObject = try JSONDecoder.swiftygram.decode(SubclassCodable<TDObject.Update>.self, from: data).value
        } catch {
            let kek = String(data: data, encoding: .utf8)!
            print(kek)
            print("Failed to parse Update")
            return
        }
        
        updateLock.lock(); defer { updateLock.unlock() }
        
        let updateHandlers = self.updateHandlers[HashableType(type(of: updateObject))]?.handlers ?? [:]
        let anyUpdateHandlers = self.anyUpdateHandlers
        
        executionQueue.async {
            for (_, handler) in updateHandlers {
                handler(updateObject)
            }
            
            for (_, handler) in anyUpdateHandlers {
                handler(updateObject)
            }
        }
    }
    
    // MARK: - Utils
    private func pushCompletionHandler(_ completionHandler: @escaping TDDataResultHandler) -> UInt64 {
        queryLock.lock(); defer { queryLock.unlock() }
        
        completionHandlers[nextQueryId] = completionHandler
        let initialQueryId = nextQueryId
        nextQueryId += 1
        
        return initialQueryId
    }
    
    private func completionHandler(for queryId: UInt64) -> TDDataResultHandler? {
        queryLock.lock(); defer { queryLock.unlock() }
        
        return completionHandlers.removeValue(forKey: queryId)
    }
    
}
