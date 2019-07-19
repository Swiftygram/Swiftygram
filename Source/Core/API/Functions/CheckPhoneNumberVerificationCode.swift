//
//  CheckPhoneNumberVerificationCode.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Checks the phone number verification code for Telegram Passport

     - ReturnType: `TDObject.Ok`
     */
    struct CheckPhoneNumberVerificationCode: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Verification code
         */
        public var code: String

        /**
         Checks the phone number verification code for Telegram Passport

         - Parameter code: Verification code
         */
        public init(code: String) {
            self.code = code
        }
    }
}
