//
//  TDAuthorizerSession.swift
//  Swiftygram
//
//  Created by Oleksandr Zhuhan on 7/9/19.
//

import Foundation

public protocol TDAuthorizerSession {
    func setPhoneNumber(_ phoneNumber: String, completionHandler: ((TDPhoneNumberError?) -> ())?)
    
    func setAuthenticationCode(_ authCode: String, completionHandler: ((TDAuthenticationCodeError?) -> ())?)
    
    func resendAuthenticationCode(with completionHandler: ((TDAuthenticationCodeError?) -> ())?)
    
    func setAuthenticationPassword(_ password: String, completionHandler: ((TDAuthenticationPasswordError?) -> ())?)
    
    func requestPasswordRecovery(with completionHandler: ((TDPasswordRecoveryRequestError?) -> ())?)
    
    func setPasswordRecoveryCode(_ code: String, completionHandler: ((TDPasswordRecoveryError?) -> ())?)
    
    func signUp(with firstName: String, lastName: String, completionHandler: ((TDSignUpError?) -> ())?)
    
    func cancelSession()
}
