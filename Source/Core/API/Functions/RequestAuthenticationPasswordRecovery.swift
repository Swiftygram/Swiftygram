//
//  RequestAuthenticationPasswordRecovery.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

extension TDFunction {
    /**
     Requests to send a password recovery code to an email address that was previously set up. Works only when the current authorization state is authorizationStateWaitPassword

     - ReturnType: `TDObject.Ok`
     */
    struct RequestAuthenticationPasswordRecovery: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Requests to send a password recovery code to an email address that was previously set up. Works only when the current authorization state is authorizationStateWaitPassword
         */
        public init() {}
    }
}
