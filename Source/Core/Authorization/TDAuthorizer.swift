//
//  TDAuthorizer.swift
//  Swiftygram
//
//  Created by Oleksandr Zhuhan on 7/5/19.
//

import Foundation

// MARK: - TDAuthorizerConfiguration

public struct TDAuthorizerConfiguration {
    public var apiId: Int
    public var apiHash: String
    public var usesTestEnvironment: Bool
    public var appGroupId: String?

    public init(apiId: Int, apiHash: String, usesTestEnvironment: Bool = false, appGroupId: String? = nil) {
        self.apiId = apiId
        self.apiHash = apiHash
        self.usesTestEnvironment = usesTestEnvironment
        self.appGroupId = appGroupId
    }
}

// MARK: - TDAuthorizerDelegate

public protocol TDAuthorizerDelegate: class {
    
    func authorizer(_ authorizer: TDAuthorizerSession, didReceivePreferred countryCode: String)
    
    func authorizerRequestsPhoneNumber(_ authorizer: TDAuthorizerSession)
    
    /**
     TDLib needs the user's authentication code to finalize authorization
     
     - codeInfo: Information about the authorization code that was sent
     - isRegistered: True, if the user is already registered
     - termsOfService: Telegram terms of service, which should be accepted before user can continue registration; may be nil
     */
    func authorizer(_ authorizer: TDAuthorizerSession, requestsAuthCodeWith codeInfo: TDObject.AuthenticationCodeInfo, isRegistered: Bool, termsOfService: TDObject.TermsOfService?)
    
    func authorizerRequestsUsername(_ authorizer: TDAuthorizerSession)
    
    func authorizerDidCancelAuthorizationFlow(_ authorizer: TDAuthorizerSession)
}

// MARK: - TDAuthorizationError

public enum TDAuthorizationError: Error {
    case internalInconsistency
    case invalidAppGroupId
    case tdLib(TDObject.Error)
    case timedOut
    case cancelled
}

// MARK: - TDAuthorizer

public class TDAuthorizer {
    
    public class func authorization(with configuration: TDAuthorizerConfiguration, delegate: TDAuthorizerDelegate, completion: @escaping TDAuthorizationResultHandler) -> TDAuthorizationFlow {
        return TDInternalAuthorizer(configuration: configuration, delegate: delegate, completion: completion)
    }
    
    #if os(iOS)
    public class func authorization(with configuration: TDAuthorizerConfiguration, presentingViewController: UIViewController, completion: @escaping TDAuthorizationResultHandler) -> TDAuthorizationFlow {
        let controller = AuthorizationViewController()
        
        presentingViewController.present(controller, animated: true, completion: nil)
        
        return TDInternalAuthorizer(configuration: configuration, delegate: controller, completion: completion)
    }
    #endif

}
