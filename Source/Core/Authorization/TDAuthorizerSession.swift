//
//  TDAuthorizerSession.swift
//  Swiftygram
//
//  Created by Oleksandr Zhuhan on 7/9/19.
//

import Foundation

public protocol TDAuthorizerSession {
    func setPhoneNumber(_ phoneNumber: String, completionHandler: ((TDError?) -> ())?)
    
    func setAuthCode(_ authCode: String, completionHandler: ((TDError?) -> ())?)
    
    func resendAuthCode(with completionHandler: ((TDError?) -> ())?)
    
    func setFirstName(_ firstName: String, lastName: String, completionHandler: ((TDError?) -> ())?)
}
