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
    public func execute<Function, ResponseType>(_ function: Function, completionHandler: ((TGResult<ResponseType>) -> ())? = nil) where Function: TGFunctionProtocol<ResponseType> {
        codableQueue.async {
            let requestJSON: [String: Any]
            var responseHandler: TGCompletableResultHandler?
            
            do {
                requestJSON = try DictionaryEncoder().encode(function)
            } catch {
                completionHandler?(.failure(error))
                return
            }
            
            if let completionHandler = completionHandler {
                responseHandler = { result in
                    switch result {
                    case .jsonObject(let jsonObject):
                        do {
                            let object = try DictionaryDecoder().decode(ResponseType.self, from: jsonObject)
                            
                            completionHandler(.success(object: object, jsonObject: jsonObject))
                        } catch {
                            completionHandler(.failure(error))
                        }
                        
                    case .failure(let error):
                        completionHandler(.failure(error))
                    }
                }
            }
            
            self.execute(requestJSON, completionHandler: responseHandler)
        }
    }
    
    public func execute(_ json: [String: Any], completionHandler: TGCompletableResultHandler? = nil) {
        codableQueue.async {
            var json = json
            var queryId: UInt64?
            
            if let completionHandler = completionHandler {
                queryId = self.pushCompletionHandler(completionHandler)
                json["@extra"] = queryId
            }
            
            do {
                let data = try JSONSerialization.data(withJSONObject: json, options: [])
                
                data.withUnsafeBytes({
                    td_json_client_send(self.client, $0)
                })
                
            } catch {
                if let queryId = queryId, let completionHandler = self.completionHandler(for: queryId) {
                    completionHandler(.failure(error))
                }
            }
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
        let jsonObject: [String: Any]
        let objectType: String?
        
        do {
            guard let dict = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
                return
            }
            
            jsonObject = dict
            objectType = jsonObject["@type"] as? String
        } catch {
            print("Error while processing response: \(error)")
            return
        }
        
        if let type = objectType, type.hasPrefix("update") {
            processUpdate(jsonObject)
            return
        }
        
        guard let queryId = jsonObject["@extra"] as? UInt64,
            let completionHandler = self.completionHandler(for: queryId) else {
                return
        }
        
        if objectType == TGObject.Error.type {
            do {
                let error = try DictionaryDecoder().decode(TGObject.Error.self, from: jsonObject)
                
                completionHandler(.failure(error))
            } catch {
                completionHandler(.failure(error))
            }
            
            return
        }
        
        completionHandler(.jsonObject(jsonObject))
    }
    
    // MARK: - Update processing
    private func processUpdate(_ jsonObject: [String: Any]) {
        let updateObject: TGObject.Update
        
        do {
            updateObject = try DictionaryDecoder().decode(TGSubclassCodable<TGObject.Update>.self, from: jsonObject).value
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
