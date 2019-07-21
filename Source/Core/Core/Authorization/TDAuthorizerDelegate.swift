//
//  TDAuthorizerDelegate.swift
//  Swiftygram
//
//  Created by KY1VSTAR on 7/21/19.
//

import Foundation

public protocol TDAuthorizerDelegate: class {
    func authorizerDidStartAuthorization(_ authorizer: TDAuthorizerSession)
    
    func authorizer(_ authorizer: TDAuthorizerSession, didReceivePreferred countryCode: String)
    
    func authorizerRequestsPhoneNumber(_ authorizer: TDAuthorizerSession)
    
    /**
     TDLib needs the user's authentication code to finalize authorization
     
     - codeInfo: Information about the authorization code that was sent
     - isRegistered: True, if the user is already registered
     - termsOfService: Telegram terms of service, which should be accepted before user can continue registration; may be nil
     */
    func authorizer(_ authorizer: TDAuthorizerSession, requestsAuthCodeWith codeInfo: TDObject.AuthenticationCodeInfo, isRegistered: Bool, termsOfService: TDObject.TermsOfService?)
    
    func authorizer(_ authorizer: TDAuthorizerSession, requestsPasswordWith hint: String?)
    
    func authorizer(_ authorizer: TDAuthorizerSession, requestsPasswordRecoveryCodeWith emailPattern: String)
    
    func authorizerRequestsSignUp(_ authorizer: TDAuthorizerSession)
    
    func authorizer(_ authorizer: TDAuthorizerSession, didCompleteWithError error: TDAuthorizationError?)
}

// MARK: - Optional methods

public extension TDAuthorizerDelegate {
    func authorizer(_ authorizer: TDAuthorizerSession, didReceivePreferred countryCode: String) {}
}
