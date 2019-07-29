//
//  main.swift
//  Swiftygram Example macOS
//
//  Created by Oleksandr Zhuhan on 7/29/19.
//  Copyright © 2019 KY1VSTAR. All rights reserved.
//

import Foundation
import Swiftygram

class Kek: TDAuthorizerDelegate {
    func authorizer(_ authorizer: TDAuthorizerSession, requestsPasswordRecoveryCodeWith emailPattern: String) {
        
    }
    
    func authorizer(_ authorizer: TDAuthorizerSession, didCompleteWithError error: TDAuthorizationError?) {
        
    }
    
    func authorizer(_ authorizer: TDAuthorizerSession, requestsPasswordWith hint: String?) {
        
    }
    
    func authorizer(_ authorizer: TDAuthorizerSession, requestsAuthCodeWith codeInfo: TDObject.AuthenticationCodeInfo, isRegistered: Bool, termsOfService: TDObject.TermsOfService?) {
        
    }
    
    func authorizerDidStartAuthorization(_ authorizer: TDAuthorizerSession) {
        
    }
    
    func authorizerRequestsPhoneNumber(_ authorizer: TDAuthorizerSession) {
        
    }
    
    func authorizerRequestsSignUp(_ authorizer: TDAuthorizerSession) {
        
    }
}

let lol = TDAuthorizer.authorization(with: .init(apiId: 1, apiHash: "wewads"), delegate: Kek()) { _ in
    
}

Thread.sleep(forTimeInterval: 3)

