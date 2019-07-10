//
//  CheckAuthenticationCode.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

extension TDFunction {
    /**
     Checks the authentication code. Works only when the current authorization state is authorizationStateWaitCode

     - ReturnType: `TDObject.Ok`
     */
    struct CheckAuthenticationCode: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         The verification code received via SMS, Telegram message, phone call, or flash call
         */
        public var code: String

        /**
         If the user is not yet registered, the first name of the user; 1-64 characters. You can also pass an empty string for unregistered user there to check verification code validness. In the latter case PHONE_NUMBER_UNOCCUPIED error will be returned for a valid code
         */
        public var firstName: String

        /**
         If the user is not yet registered; the last name of the user; optional; 0-64 characters
         */
        public var lastName: String

        /**
         Checks the authentication code. Works only when the current authorization state is authorizationStateWaitCode

         - Parameter code: The verification code received via SMS, Telegram message, phone call, or flash call
         - Parameter firstName: If the user is not yet registered, the first name of the user; 1-64 characters. You can also pass an empty string for unregistered user there to check verification code validness. In the latter case PHONE_NUMBER_UNOCCUPIED error will be returned for a valid code
         - Parameter lastName: If the user is not yet registered; the last name of the user; optional; 0-64 characters
         */
        public init(code: String, firstName: String, lastName: String) {
            self.code = code
            self.firstName = firstName
            self.lastName = lastName
        }
    }
}
