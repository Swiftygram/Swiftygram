//
//  ResendEmailAddressVerificationCode.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Re-sends the code to verify an email address to be added to a user's Telegram Passport

     - ReturnType: `TDObject.EmailAddressAuthenticationCodeInfo`
     */
    struct ResendEmailAddressVerificationCode: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.EmailAddressAuthenticationCodeInfo

        /**
         Re-sends the code to verify an email address to be added to a user's Telegram Passport
         */
        public init() {}
    }
}
