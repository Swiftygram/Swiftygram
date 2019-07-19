//
//  ResendPhoneNumberVerificationCode.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Re-sends the code to verify a phone number to be added to a user's Telegram Passport

     - ReturnType: `TDObject.AuthenticationCodeInfo`
     */
    struct ResendPhoneNumberVerificationCode: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.AuthenticationCodeInfo

        /**
         Re-sends the code to verify a phone number to be added to a user's Telegram Passport
         */
        public init() {}
    }
}
