//
//  SetRecoveryEmailAddress.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Changes the 2-step verification recovery email address of the user. If a new recovery email address is specified, then the change will not be applied until the new recovery email address is confirmed-If new_recovery_email_address is the same as the email address that is currently set up, this call succeeds immediately and aborts all other requests waiting for an email confirmation

     - ReturnType: `TDObject.PasswordState`
     */
    struct SetRecoveryEmailAddress: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.PasswordState

        /**
         Password of the current user
         */
        public var password: String

        /**
         New recovery email address
         */
        public var newRecoveryEmailAddress: String

        /**
         Changes the 2-step verification recovery email address of the user. If a new recovery email address is specified, then the change will not be applied until the new recovery email address is confirmed-If new_recovery_email_address is the same as the email address that is currently set up, this call succeeds immediately and aborts all other requests waiting for an email confirmation

         - Parameter password: Password of the current user
         - Parameter newRecoveryEmailAddress: New recovery email address
         */
        public init(password: String, newRecoveryEmailAddress: String) {
            self.password = password
            self.newRecoveryEmailAddress = newRecoveryEmailAddress
        }
    }
}
