//
//  RecoverPassword.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Recovers the password using a recovery code sent to an email address that was previously set up

     - ReturnType: `TDObject.PasswordState`
     */
    struct RecoverPassword: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.PasswordState

        /**
         Recovery code to check
         */
        public let recoveryCode: String

        /**
         Recovers the password using a recovery code sent to an email address that was previously set up

         - Parameter recoveryCode: Recovery code to check
         */
        public init(recoveryCode: String) {
            self.recoveryCode = recoveryCode
        }
    }
}
