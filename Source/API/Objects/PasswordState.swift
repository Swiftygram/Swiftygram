//
//  PasswordState.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Represents the current state of 2-step verification
     */
    struct PasswordState: TDObjectProtocol {
        /**
         True, if a 2-step verification password is set
         */
        public let hasPassword: Bool

        /**
         Hint for the password; may be empty
         */
        public let passwordHint: String

        /**
         True, if a recovery email is set
         */
        public let hasRecoveryEmailAddress: Bool

        /**
         True, if some Telegram Passport elements were saved
         */
        public let hasPassportData: Bool

        /**
         Information about the recovery email address to which the confirmation email was sent; may be null
         */
        public let recoveryEmailAddressCodeInfo: TDObject.EmailAddressAuthenticationCodeInfo

        /**
         Represents the current state of 2-step verification

         - Parameter hasPassword: True, if a 2-step verification password is set
         - Parameter passwordHint: Hint for the password; may be empty
         - Parameter hasRecoveryEmailAddress: True, if a recovery email is set
         - Parameter hasPassportData: True, if some Telegram Passport elements were saved
         - Parameter recoveryEmailAddressCodeInfo: Information about the recovery email address to which the confirmation email was sent; may be null
         */
        public init(hasPassword: Bool, passwordHint: String, hasRecoveryEmailAddress: Bool, hasPassportData: Bool, recoveryEmailAddressCodeInfo: TDObject.EmailAddressAuthenticationCodeInfo) {
            self.hasPassword = hasPassword
            self.passwordHint = passwordHint
            self.hasRecoveryEmailAddress = hasRecoveryEmailAddress
            self.hasPassportData = hasPassportData
            self.recoveryEmailAddressCodeInfo = recoveryEmailAddressCodeInfo
        }
    }
}
