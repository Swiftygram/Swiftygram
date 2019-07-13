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
    
    public let authorization: TDAuthorization
    public let configuration: Configuration
    
    private let client = td_json_client_create()
    private let executionQueue = DispatchQueue(label: "TDClient.executionQueue", qos: .background, attributes: .concurrent)
    private let processingQueue = DispatchQueue(label: "TDClient.processingQueue")
    private let runLoopQueue = DispatchQueue(label: "TDClient.runLoopQueue")
    
    private let queryLock = MutexLock()
    private var completionHandlers = [UInt64: TDDataResultHandler]()
    private var queryTimers = [UInt64: DispatchOnceTimer]()
    private var pendingFunctions = [UInt64: PendingFunction]()
    private var nextQueryId: UInt64 = 0
    
    private let updateLock = MutexLock()
    private var updateHandlers = [HashableType: UpdateObserverInfo]()
    private var anyUpdateHandlers = [UInt64: UpdateHandler]()
    private var anyUpdateNextId: UInt64 = 0
    
    private let shouldHandleAuthorizationState: Bool
    private var authorizationStateObservation: TDCancellable?
    let internalAuthorizationState = TDSubject<TDEnum.AuthorizationState?>(nil)
    
    public let authorizationState = TDSubject<TDAuthorizationState>(.initializing)
    
    public convenience init(authorization: TDAuthorization, configuration: Configuration = .default) {
        self.init(authorization: authorization, configuration: configuration, shouldHandleAuthorizationState: true)
    }
    
    init(authorization: TDAuthorization, configuration: Configuration, shouldHandleAuthorizationState: Bool) {
        self.authorization = authorization
        self.configuration = configuration
        self.shouldHandleAuthorizationState = shouldHandleAuthorizationState
        
        authorizationStateObservation = observeUpdates(for: TDObject.UpdateAuthorizationState.self, updateHandler: { [weak self] update in
            self?.internalAuthorizationState.value = update.authorizationState
        })
        
        start()
    }
    
    deinit {
        td_json_client_destroy(client)
        
        // notify all pending completion handlers
        queryLock.lock()
        
        let completionHandlers = self.completionHandlers
        self.completionHandlers = [:]
        queryTimers = [:]
        pendingFunctions = [:]
        
        queryLock.unlock()
        
        if completionHandlers.isEmpty {
            return
        }
        
        processingQueue.async {
            completionHandlers
                .sorted(by: { $0.key < $1.key })
                .forEach { _, completion in
                    completion(.failure(.cancelled))
                }
        }
    }
    
    private func handleAuthorizationState(_ authorizationState: TDEnum.AuthorizationState) {
        switch authorizationState {
        case .waitTdlibParameters:
            guard shouldHandleAuthorizationState else { return }
            
            guard let parameters = try? generateTdlibParameters() else {
                self.authorizationState.value = .unauthorized
                return
            }
            
            let query = TDFunction.SetTdlibParameters(parameters: parameters)
            
            execute(query) { [weak self] result in
                if case .failure = result {
                    self?.authorizationState.value = .unauthorized
                }
            }
            
        case .waitEncryptionKey:
            guard shouldHandleAuthorizationState else { return }
            
            let query = TDFunction.CheckDatabaseEncryptionKey(encryptionKey: authorization.databaseEncryptionKey)
            
            execute(query) { [weak self] result in
                if case .failure = result {
                    self?.authorizationState.value = .unauthorized
                }
            }
            
        case .ready:
            self.authorizationState.value = .authorized
            
            executePendingFunctions()
            
        default:
            self.authorizationState.value = .unauthorized
        }
    }
    
    /**
     Sends a request to the TDLib.
     
     - Parameter function:
     */
    public func execute<Function>(
        _ function: Function,
        callbackQueue: DispatchQueue? = nil,
        timeoutInterval: TimeInterval? = nil,
        completionHandler: TDResultHandler<Function.ReturnType>? = nil
        ) where Function: TDFunctionProtocol {
        
        // encoding and executing
        let execution: PendingFunction = { client, queryId in
            let wrappedFunction = FunctionWrapper(function: function, queryId: queryId)
            
            do {
                let data = try JSONEncoder.swiftygram.encode(wrappedFunction)
                
                client.send(data: data)
                
            } catch {
                if let queryId = queryId, let completionHandler = client.completionHandler(for: queryId) {
                    completionHandler(.failure(.encoding(error)))
                }
            }
        }
        
        executionQueue.async {
            var queryId: UInt64?
            var responseHandler: TDDataResultHandler?
            
            self.queryLock.lock()
            
            // response parser
            if var completionHandler = completionHandler {
                completionHandler = (callbackQueue ?? self.configuration.callbackQueue).wrap(completionHandler)
                
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
                
                queryId = self.pushCompletionHandlerLocked(responseHandler!, timeoutInterval: timeoutInterval ?? self.configuration.timeoutInterval)
                
            }
            
            if self.canExecuteFunction(Function.self) {
                self.queryLock.unlock()
                
                execution(self, queryId)
                
            } else {
                // enqueue function to future execution
                if queryId == nil {
                    queryId = self.nextQueryId
                    self.nextQueryId += 1
                }
                
                self.pendingFunctions[queryId!] = execution
                
                self.queryLock.unlock()
            }
        }
    }
    
    private func canExecuteFunction(_ function: Any.Type) -> Bool {
        return !shouldHandleAuthorizationState ||
            function is AuthorizationIndependentFunction.Type
    }
    
    private func executePendingFunctions() {
        queryLock.lock(); defer { queryLock.unlock() }
        
        let functions = pendingFunctions
        
        if functions.isEmpty {
            return
        }
        
        executionQueue.async {
            functions
                .sorted(by: { $0.key < $1.key })
                .forEach { queryId, execution in
                    execution(self, queryId)
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

                self.processingQueue.async {
                    guard let data = string.data(using: .utf8) else { return }
                    
                    self.processData(data)
                }
            }
        }
    }
    
    // MARK: - Update observation
    public func observeUpdates<Update>(
        for update: Update.Type,
        callbackQueue: DispatchQueue? = nil,
        updateHandler: @escaping ((Update) -> ())
        ) -> TDCancellable where Update: TDObject.Update {
        
        updateLock.lock(); defer { updateLock.unlock() }
        
        let updateHandler = (callbackQueue ?? configuration.callbackQueue).wrap(updateHandler)
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
    
    public func observerUpdates(
        on callbackQueue: DispatchQueue? = nil,
        updateHandler: @escaping ((TDObject.Update) -> ())
        ) -> TDCancellable {
        
        updateLock.lock(); defer { updateLock.unlock() }
        
        let id = anyUpdateNextId
        anyUpdateNextId += 1
        anyUpdateHandlers[id] = (callbackQueue ?? configuration.callbackQueue).wrap(updateHandler)
        
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
        
        updateLock.lock()
        
        let updateHandlers = self.updateHandlers[HashableType(type(of: updateObject))]?.handlers ?? [:]
        let anyUpdateHandlers = self.anyUpdateHandlers
        
        updateLock.unlock()
        
        for (_, handler) in updateHandlers {
            handler(updateObject)
        }
        
        for (_, handler) in anyUpdateHandlers {
            handler(updateObject)
        }
    }
    
    // MARK: - Utils
    private func pushCompletionHandlerLocked(_ completionHandler: @escaping TDDataResultHandler, timeoutInterval: TimeInterval) -> UInt64 {
        let initialQueryId = nextQueryId
        nextQueryId += 1
        
        completionHandlers[initialQueryId] = completionHandler
        
        if timeoutInterval > 0 {
            queryTimers[initialQueryId] = DispatchOnceTimer(queue: processingQueue, delay: timeoutInterval, eventHandler: { [weak self] in
                self?.completionHandler(for: initialQueryId)?(.failure(.timedOut))
            })
        }
        
        return initialQueryId
    }
    
    private func completionHandler(for queryId: UInt64) -> TDDataResultHandler? {
        queryLock.lock(); defer { queryLock.unlock() }
        
        queryTimers[queryId] = nil
        pendingFunctions[queryId] = nil
        
        return completionHandlers.removeValue(forKey: queryId)
    }
    
    func generateTdlibParameters() throws -> TDObject.TdlibParameters {
        let fileManager = FileManager.default
        var databaseURL: URL
        var filesURL: URL
        
        if let appGroupId = authorization.appGroupId {
            guard let appGroupURL = fileManager.containerURL(forSecurityApplicationGroupIdentifier: appGroupId) else {
                throw TDAuthorizationError.invalidAppGroupId
            }
            
            databaseURL = appGroupURL
            filesURL = appGroupURL.appendingPathComponent("Library/Caches")
        } else {
            databaseURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
            filesURL = fileManager.urls(for: .cachesDirectory, in: .userDomainMask).first!
        }
        
        let pathComponent = ".Swiftygram/\(authorization.accountId)"
        databaseURL.appendPathComponent(pathComponent)
        filesURL.appendPathComponent(pathComponent)
        
//        try fileManager.createDirectory(at: databaseURL, withIntermediateDirectories: true, attributes: nil)
//        try fileManager.createDirectory(at: filesURL, withIntermediateDirectories: true, attributes: nil)
        
        return .init(useTestDc: authorization.usesTestEnvironment,
                     databaseDirectory: databaseURL.path,
                     filesDirectory: filesURL.path,
                     useFileDatabase: configuration.usesFileDatabase,
                     useChatInfoDatabase: configuration.usesChatInfoDatabase,
                     useMessageDatabase: configuration.usesMessageDatabase,
                     useSecretChats: configuration.usesSecretChats,
                     apiId: authorization.apiId,
                     apiHash: authorization.apiHash,
                     systemLanguageCode: configuration.systemLanguageCode,
                     deviceModel: configuration.deviceModel,
                     systemVersion: configuration.systemVersion,
                     applicationVersion: configuration.applicationVersion,
                     enableStorageOptimizer: configuration.enableStorageOptimizer,
                     ignoreFileNames: configuration.ignoresFileNames)
    }
    
}
