//
//  SendEmailAddressVerificationCode.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Sends a code to verify an email address to be added to a user's Telegram Passport

     - ReturnType: `TDObject.EmailAddressAuthenticationCodeInfo`
     */
    struct SendEmailAddressVerificationCode: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.EmailAddressAuthenticationCodeInfo

        /**
         Email address
         */
        public let emailAddress: String

        /**
         Sends a code to verify an email address to be added to a user's Telegram Passport

         - Parameter emailAddress: Email address
         */
        public init(emailAddress: String) {
            self.emailAddress = emailAddress
        }
    }
}
