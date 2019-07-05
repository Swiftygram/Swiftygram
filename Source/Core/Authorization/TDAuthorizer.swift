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
}

// MARK: - TDAuthorizerDelegate

public protocol TDAuthorizerDelegate: class {
    
}

// MARK: - TDAuthorizer

public final class TDAuthorizer {
    
    // MARK: - Static scope
    
    public class func authorization(with configuration: TDAuthorizerConfiguration, delegate: TDAuthorizerDelegate, completion: @escaping TDAuthorizationResultHandler) {
        
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
        
        authorization = TDAuthorization(apiId: configuration.apiId,
                                        apiHash: configuration.apiHash,
                                        accountId: UUID().uuidString,
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
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "/Swiftygram"
        
        let parameters = TDObject.TdlibParameters(useTestDc: false,
                                                  databaseDirectory: path,
                                                  filesDirectory: path,
                                                  useFileDatabase: true,
                                                  useChatInfoDatabase: true,
                                                  useMessageDatabase: true,
                                                  useSecretChats: false,
                                                  apiId: 110110,
                                                  apiHash: "2e4f47c07d66d4461943d47f4f18a555",
                                                  systemLanguageCode: "ru",
                                                  deviceModel: "iPhone",
                                                  systemVersion: "11.1",
                                                  applicationVersion: "1.0",
                                                  enableStorageOptimizer: false,
                                                  ignoreFileNames: true)
        
        switch authorizationState {
        case .waitTdlibParameters:
            let query = TDFunction.SetTdlibParameters(parameters: parameters)
            
            client.execute(query, completionHandler: { [weak self] result in
                DispatchQueue.main.async {
                    if case .failure(let error) = result, let self = self {
                        self.completion(.failure(error))
                    }
                }
            })
            
        case .waitEncryptionKey:
            let query = TDFunction.CheckDatabaseEncryptionKey(encryptionKey: "kekLol21312323123136")
            
            client.execute(query, completionHandler: { [weak self] result in
                DispatchQueue.main.async {
                    if case .failure(let error) = result, let self = self {
                        self.completion(.failure(error))
                    }
                }
            })
            
        case .waitPhoneNumber:
            let query = TDFunction.SetAuthenticationPhoneNumber(phoneNumber: "380957965942", allowFlashCall: false, isCurrentPhoneNumber: true)
            
            client.execute(query, completionHandler: { result in
                print(result)
                print()
            })
            
        case .waitCode:
            let code = "96917"
            
            print()
            print(code)
            print()
            let query = TDFunction.CheckAuthenticationCode(code: code, firstName: "", lastName: "")
            
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
    
}
