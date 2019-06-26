//
//  RecoverAuthenticationPassword.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Recovers the password with a password recovery code sent to an email address that was previously set up. Works only when the current authorization state is authorizationStateWaitPassword

     - ReturnType: `TDObject.Ok`
     */
    struct RecoverAuthenticationPassword: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Recovery code to check
         */
        public let recoveryCode: String

        /**
         Recovers the password with a password recovery code sent to an email address that was previously set up. Works only when the current authorization state is authorizationStateWaitPassword

         - Parameter recoveryCode: Recovery code to check
         */
        public init(recoveryCode: String) {
            self.recoveryCode = recoveryCode
        }
    }
}
