//
//  TDInternalAuthorizer.swift
//  Swiftygram
//
//  Created by Oleksandr Zhuhan on 7/9/19.
//

import Foundation

class TDInternalAuthorizer {
    
    private var cancellableBag = [TDCancellable]()
    private let configuration: TDAuthorizerConfiguration
    private weak var delegate: TDAuthorizerDelegate?
    private var completion: TDAuthorizationResultHandler?
    private let authorization: TDAuthorization
    private let client: TDClient
    private var hasRecoveryEmailAddress = false
    
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
        
        var configuration = TDClient.Configuration.default
        configuration.callbackQueue = .main
        
        client = TDClient(authorization: authorization, configuration: configuration, shouldHandleAuthorizationState: false)
        
        delegate.authorizerDidStartAuthorization(self)
        
        cancellableBag.append(
            client
                .internalAuthorizationState
                .observe(.main) { [weak self] authorizationState, _ in
                    guard let authorizationState = authorizationState,
                        let self = self else { return }
                    
                    self.handleAuthorizationState(authorizationState)
            }
        )
        
        fetchCountryCode()
    }
    
    private func fetchCountryCode() {
        let query = TDFunction.GetCountryCode()
        
        client.execute(query) { [weak self] result in
            if case .success(let countryCode) = result, let self = self {
                self.delegate?.authorizer(self, didReceivePreferred: countryCode.text)
            }
        }
    }
    
    private func handleAuthorizationState(_ authorizationState: TDEnum.AuthorizationState) {
        switch authorizationState {
        case .waitTdlibParameters:
            let parameters: TDObject.TdlibParameters
            do {
                parameters = try client.generateTdlibParameters()
            }
            catch {
                handleError(error)
                return
            }
            
            let query = TDFunction.SetTdlibParameters(parameters: parameters)
            
            client.execute(query, completionHandler: { [weak self] result in
                if case .failure(let error) = result, let self = self {
                    self.handleError(error)
                }
            })
            
        case .waitEncryptionKey:
            let query = TDFunction.CheckDatabaseEncryptionKey(encryptionKey: authorization.databaseEncryptionKey)
            
            client.execute(query, completionHandler: { [weak self] result in
                if case .failure(let error) = result, let self = self {
                    self.handleError(error)
                }
            })
            
        case .waitPhoneNumber:
            delegate?.authorizerRequestsPhoneNumber(self)
            
        case let .waitCode(isRegistred, termsOfService, codeInfo):
            delegate?.authorizer(self, requestsAuthCodeWith: codeInfo, isRegistered: isRegistred, termsOfService: termsOfService)
            
        case let .waitPassword(passwordHint, hasRecoveryEmailAddress, recoveryEmailAddressPattern):
            self.hasRecoveryEmailAddress = hasRecoveryEmailAddress
            
            if recoveryEmailAddressPattern.isEmpty {
                delegate?.authorizer(self, requestsPasswordWith: passwordHint.isEmpty ? nil : passwordHint)
            } else {
                delegate?.authorizer(self, requestsPasswordRecoveryCodeWith: recoveryEmailAddressPattern)
            }
            
        case .ready:
            let query = TDFunction.GetMe()
//            let query = TDFunction.DeleteAccount(reason: "")
            
            client.execute(query, completionHandler: { result in
                print(result)
                print()
            })
            
        default:
            print(authorizationState)
            print()
        }
    }
    
    private func handleError(_ error: Error) {
        guard let completion = completion else { return }
        
        self.completion = nil
        let finalError: TDAuthorizationError
        
        switch error {
        case let error as TDError:
            switch error {
            case .tdLib(let tdLibError):
                finalError = .tdLib(tdLibError)
                
            case .timedOut:
                finalError = .timedOut
                
            default:
                finalError = .internalInconsistency
            }
            
        case let error as TDAuthorizationError:
            finalError = error
            
        default:
            finalError = .internalInconsistency
        }
        
        completion(.failure(finalError))
        
        delegate?.authorizer(self, didCompleteWithError: finalError)
    }
    
}

// MARK: - TDAuthorizerSession

extension TDInternalAuthorizer: TDAuthorizerSession {
    func setPhoneNumber(_ phoneNumber: String, completionHandler: ((TDPhoneNumberError?) -> ())?) {
        let query = TDFunction.SetAuthenticationPhoneNumber(phoneNumber: phoneNumber, allowFlashCall: false, isCurrentPhoneNumber: true)
        
        client.execute(query, completionHandler: { result in
            if case .failure(let error) = result {
                if let newError = TDPhoneNumberError(error: error) {
                    completionHandler?(newError)
                }
            } else {
                completionHandler?(nil)
            }
        })
    }
    
    func setAuthenticationCode(_ authCode: String, completionHandler: ((TDAuthenticationCodeError?) -> ())?) {
        let query = TDFunction.CheckAuthenticationCode(code: authCode, firstName: "", lastName: "")
        
        client.execute(query, completionHandler: { [weak self] result in
            if case .failure(let error) = result {
                if case .tdLib(let tdLibError) = error,
                    tdLibError.message == "PHONE_NUMBER_UNOCCUPIED" {
                    if let self = self {
                        self.delegate?.authorizerRequestsSignUp(self)
                    }
                    
                    completionHandler?(nil)
                    
                } else if let newError = TDAuthenticationCodeError(error: error) {
                    completionHandler?(newError)
                }
            } else {
                completionHandler?(nil)
            }
        })
    }
    
    func resendAuthenticationCode(with completionHandler: ((TDAuthenticationCodeError?) -> ())?) {
        let query = TDFunction.ResendAuthenticationCode()
        
        client.execute(query, completionHandler: { result in
            if case .failure(let error) = result {
                if let newError = TDAuthenticationCodeError(error: error) {
                    completionHandler?(newError)
                }
            } else {
                completionHandler?(nil)
            }
        })
    }
    
    func setAuthenticationPassword(_ password: String, completionHandler: ((TDAuthenticationPasswordError?) -> ())?) {
        let query = TDFunction.CheckAuthenticationPassword(password: password)
        
        client.execute(query, completionHandler: { result in
            if case .failure(let error) = result {
                if let newError = TDAuthenticationPasswordError(error: error) {
                    completionHandler?(newError)
                }
            } else {
                completionHandler?(nil)
            }
        })
    }
    
    func requestPasswordRecovery(with completionHandler: ((TDPasswordRecoveryRequestError?) -> ())?) {
        guard hasRecoveryEmailAddress else {
            completionHandler?(.unavailable)
            return
        }
        
        let query = TDFunction.RequestAuthenticationPasswordRecovery()
        
        client.execute(query, completionHandler: { result in
            if case .failure(let error) = result {
                if let newError = TDPasswordRecoveryRequestError(error: error) {
                    completionHandler?(newError)
                }
            } else {
                completionHandler?(nil)
            }
        })
    }
    
    func setPasswordRecoveryCode(_ code: String, completionHandler: ((TDPasswordRecoveryError?) -> ())?) {
        let query = TDFunction.RecoverAuthenticationPassword(recoveryCode: code)
        
        client.execute(query, completionHandler: { result in
            if case .failure(let error) = result {
                if let newError = TDPasswordRecoveryError(error: error) {
                    completionHandler?(newError)
                }
            } else {
                completionHandler?(nil)
            }
        })
    }
    
    func signUp(with firstName: String, lastName: String, completionHandler: ((TDSignUpError?) -> ())?) {
        let query = TDFunction.CheckAuthenticationCode(code: "11111", firstName: firstName, lastName: lastName)
        
        client.execute(query, completionHandler: { result in
            if case .failure(let error) = result {
                if let newError = TDSignUpError(error: error) {
                    completionHandler?(newError)
                }
            } else {
                completionHandler?(nil)
            }
        })
    }
    
    func cancelSession() {
        handleError(TDAuthorizationError.cancelled)
    }
}

// MARK: - TDAuthorizationFlow

extension TDInternalAuthorizer: TDAuthorizationFlow {
    func cancelFlow() {
        cancelSession()
    }
}
