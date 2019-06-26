//
//  SetPassword.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Changes the password for the user. If a new recovery email address is specified, then the change will not be applied until the new recovery email address is confirmed

     - ReturnType: `TDObject.PasswordState`
     */
    struct SetPassword: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.PasswordState

        /**
         Previous password of the user
         */
        public let oldPassword: String

        /**
         New password of the user; may be empty to remove the password
         */
        public let newPassword: String

        /**
         New password hint; may be empty
         */
        public let newHint: String

        /**
         Pass true if the recovery email address should be changed
         */
        public let setRecoveryEmailAddress: Bool

        /**
         New recovery email address; may be empty
         */
        public let newRecoveryEmailAddress: String

        /**
         Changes the password for the user. If a new recovery email address is specified, then the change will not be applied until the new recovery email address is confirmed

         - Parameter oldPassword: Previous password of the user
         - Parameter newPassword: New password of the user; may be empty to remove the password
         - Parameter newHint: New password hint; may be empty
         - Parameter setRecoveryEmailAddress: Pass true if the recovery email address should be changed
         - Parameter newRecoveryEmailAddress: New recovery email address; may be empty
         */
        public init(oldPassword: String, newPassword: String, newHint: String, setRecoveryEmailAddress: Bool, newRecoveryEmailAddress: String) {
            self.oldPassword = oldPassword
            self.newPassword = newPassword
            self.newHint = newHint
            self.setRecoveryEmailAddress = setRecoveryEmailAddress
            self.newRecoveryEmailAddress = newRecoveryEmailAddress
        }
    }
}
