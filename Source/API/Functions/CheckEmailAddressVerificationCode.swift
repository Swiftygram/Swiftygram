//
//  CheckEmailAddressVerificationCode.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Checks the email address verification code for Telegram Passport

     - ReturnType: `TDObject.Ok`
     */
    struct CheckEmailAddressVerificationCode: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Verification code
         */
        public let code: String

        /**
         Checks the email address verification code for Telegram Passport

         - Parameter code: Verification code
         */
        public init(code: String) {
            self.code = code
        }
    }
}
