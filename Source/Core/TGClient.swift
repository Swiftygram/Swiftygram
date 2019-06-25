//
//  TGClient.swift
//  Swiftygram
//
//  Created by KY1VSTAR on 5/16/19.
//  Copyright © 2019 KY1VSTAR. All rights reserved.
//

import Foundation
import tdjson

typealias UpdateObserverInfo = (nextId: UInt64, handlers: [UInt64: Any])

public class TGClient {
    
    private let client = td_json_client_create()
    private let codableQueue = DispatchQueue(label: "TGClient.codableQueue", qos: .background, attributes: .concurrent)
    private let runLoopQueue = DispatchQueue(label: "TGClient.runLoopQueue")
    
    private let queryLock = NSRecursiveLock()
    private var completionHandlers = [UInt64: TGCompletableResultHandler]()
    private var nextQueryId: UInt64 = 0
    
    private let updateLock = NSRecursiveLock()
    private var updateHandlers = [HashableType: UpdateObserverInfo]()
    
    public init() {
        start()
    }
    
    deinit {
        td_json_client_destroy(client)
    }
    
    // MARK: - Functions executor
    public func execute<Function>(_ function: Function, completionHandler: ((TGResult<Function.ReturnType>) -> ())? = nil) where Function: TDFunctionProtocol {
        codableQueue.async {
            var queryId: UInt64?
            var responseHandler: TGCompletableResultHandler?

            if let completionHandler = completionHandler {
                responseHandler = { result in
                    switch result {
                    case .data(let data):
                        do {
                            let object = try JSONDecoder.swiftygram.decode(Function.ReturnType.self, from: data)
                            
                            completionHandler(.success(object: object))
                        } catch {
                            completionHandler(.failure(error))
                        }
                        
                    case .failure(let error):
                        completionHandler(.failure(error))
                    }
                }
                
                queryId = self.pushCompletionHandler(responseHandler!)
            }
            
            let wrappedFunction = FunctionWrapper(function: function, queryId: queryId)
            
            do {
                let data = try JSONEncoder.swiftygram.encode(wrappedFunction)
                
                self.execute(data)
            } catch {
                if let queryId = queryId, let completionHandler = self.completionHandler(for: queryId) {
                    completionHandler(.failure(error))
                }
            }
        }
    }
    
    public func execute(_ data: Data) {
        codableQueue.async {
            data.withUnsafeBytes({
                td_json_client_send(self.client, $0)
            })
        }
    }
    
    // MARK: - Run loop
    private func start() {
        runLoopQueue.async { [weak self] in
            while let self = self {
                guard let result = td_json_client_receive(self.client, 10) else { continue }
                
                // FIXME
                let string = String(cString: result)
                let data = string.data(using: .utf8)!
                
                self.codableQueue.async {
                    self.processData(data)
                }
            }
        }
    }
    
    // MARK: - Update observation
//    public func observerUpdate(_ )
    
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

                completionHandler(.failure(error))
            } catch {
                completionHandler(.failure(error))
            }

            return
        }
        
        completionHandler(.data(data))
    }
    
    // MARK: - Update processing
    private func processUpdate(_ data: Data) {
        let updateObject: TDObject.Update
        
        do {
            updateObject = try JSONDecoder.swiftygram.decode(SubclassCodable<TDObject.Update>.self, from: data).value
            print(updateObject)
        } catch {
            print("Failed to parse Update")
        }
    }
    
    // MARK: - Utils
    private func pushCompletionHandler(_ completionHandler: @escaping TGCompletableResultHandler) -> UInt64 {
        queryLock.lock(); defer { queryLock.unlock() }
        
        completionHandlers[nextQueryId] = completionHandler
        let initialQueryId = nextQueryId
        nextQueryId += 1
        
        return initialQueryId
    }
    
    private func completionHandler(for queryId: UInt64) -> TGCompletableResultHandler? {
        queryLock.lock(); defer { queryLock.unlock() }
        
        return completionHandlers.removeValue(forKey: queryId)
    }
    
}
