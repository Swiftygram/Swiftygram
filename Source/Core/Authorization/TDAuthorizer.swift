//
//  TDAuthorizer.swift
//  Swiftygram
//
//  Created by Oleksandr Zhuhan on 7/5/19.
//

import Foundation

public enum TDAuthorizationResult {
    
    case success(TDAuthorization)
    case failure(TDError)
    
}

public typealias TDAuthorizationResultHandler = (TDAuthorizationResult) -> ()

// MARK: - TDAuthorizerConfiguration

public struct TDAuthorizerConfiguration {
    public var apiId: Int
    public var apiHash: String
    public var usesTestEnvironment: Bool
    public var appGroupId: String?

    public init(apiId: Int, apiHash: String, usesTestEnvironment: Bool, appGroupId: String?) {
        self.apiId = apiId
        self.apiHash = apiHash
        self.usesTestEnvironment = usesTestEnvironment
        self.appGroupId = appGroupId
    }
}

// MARK: - TDAuthorizerDelegate

public protocol TDAuthorizerDelegate: class {
    func authorizerRequestsPhoneNumber(_ authorizer: TDAuthorizer)
    func authorizer(_ authorizer: TDAuthorizer, didFailToSet phoneNumber: String, withError error: TDAuthorizationError)
    
    func authorizerDidCancelAuthorizationFlow(_ authorizer: TDAuthorizer)
}

// MARK: - TDAuthorizationError

public enum TDAuthorizationError: Error {
    case invalidAppGroupId
}

// MARK: - TDAuthorizer

public final class TDAuthorizer {
    
    // MARK: - Static scope
    
    public class func authorization(with configuration: TDAuthorizerConfiguration, delegate: TDAuthorizerDelegate, completion: @escaping TDAuthorizationResultHandler) -> TDAuthorizer {
        return .init(configuration: configuration, delegate: delegate, completion: completion)
    }
    
    // MARK: - Instance scope
    
    private var cancellableBag = [TDCancellable]()
    private let configuration: TDAuthorizerConfiguration
    private weak var delegate: TDAuthorizerDelegate?
    private let completion: TDAuthorizationResultHandler
    private let authorization: TDAuthorization
    private let client: TDClient
    
    init(configuration: TDAuthorizerConfiguration, delegate: TDAuthorizerDelegate, completion: @escaping TDAuthorizationResultHandler) {
        self.configuration = configuration
        self.delegate = delegate
        self.completion = completion
        
        let databaseEncryptionKey = String(
            UUID()
                .uuidString
                .components(separatedBy: "-")
                .joined()
                .prefix(20)
        )
        
        authorization = TDAuthorization(apiId: configuration.apiId,
                                        apiHash: configuration.apiHash,
                                        accountId: UUID().uuidString,
                                        databaseEncryptionKey: databaseEncryptionKey,
                                        usesTestEnvironment: configuration.usesTestEnvironment,
                                        appGroupId: configuration.appGroupId)
        
        client = TDClient(authorization: authorization)
        
        cancellableBag.append(
            client
                .internalAuthorizationState
                .observe(.main) { [weak self] authorizationState, _ in
                    guard let authorizationState = authorizationState,
                        let self = self else { return }
                    
                    self.handleAuthorizationState(authorizationState)
            }
        )
    }
    
    private func handleAuthorizationState(_ authorizationState: TDEnum.AuthorizationState) {
        switch authorizationState {
        case .waitTdlibParameters:
            let parameters: TDObject.TdlibParameters
            do {
                parameters = try client.generateTdlibParameters()
            }
            catch {
                completion(.failure(error as! TDError))
                return
            }
            
            let query = TDFunction.SetTdlibParameters(parameters: parameters)
            
            client.execute(query, completionHandler: { [weak self] result in
                DispatchQueue.main.async {
                    if case .failure(let error) = result, let self = self {
                        self.completion(.failure(error))
                    }
                }
            })
            
        case .waitEncryptionKey:
            let query = TDFunction.CheckDatabaseEncryptionKey(encryptionKey: authorization.databaseEncryptionKey)
            
            client.execute(query, completionHandler: { [weak self] result in
                DispatchQueue.main.async {
                    if case .failure(let error) = result, let self = self {
                        self.completion(.failure(error))
                    }
                }
            })
            
        case .waitPhoneNumber:
            delegate?.authorizerRequestsPhoneNumber(self)
            
            
            
        case .waitCode:
//            let code = "96917"
//
//            print()
//            print(code)
//            print()
//            let query = TDFunction.CheckAuthenticationCode(code: code, firstName: "", lastName: "")
//
//            client.execute(query, completionHandler: { result in
//                print(result)
//                print()
//            })
            
            let query = TDFunction.SetAuthenticationPhoneNumber(phoneNumber: "380957", allowFlashCall: false, isCurrentPhoneNumber: true)
            
            client.execute(query, completionHandler: { result in
                print(result)
                print()
            })
            
        case .ready:
            let query = TDFunction.GetMe()
            
            client.execute(query, completionHandler: { result in
                //                    assert(!isSecondClient)
                print(result)
                print()
            })
            
        default:
            print(authorizationState)
            print()
        }
    }
    
    public func setPhoneNumber(_ phoneNumber: String) {
        let query = TDFunction.SetAuthenticationPhoneNumber(phoneNumber: phoneNumber, allowFlashCall: false, isCurrentPhoneNumber: true)
        
        client.execute(query, completionHandler: { [weak self] result in
            DispatchQueue.main.async {
                if case .failure(let error) = result, let self = self {
                    self.delegate?.authorizer(self, didFailToSet: phoneNumber, withError: TDAuthorizationError.invalidAppGroupId)
                }
            }
        })
    }
    
}
