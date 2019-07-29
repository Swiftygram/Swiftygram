//
//  SendPhoneNumberVerificationCode.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Sends a code to verify a phone number to be added to a user's Telegram Passport

     - ReturnType: `TDObject.AuthenticationCodeInfo`
     */
    struct SendPhoneNumberVerificationCode: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.AuthenticationCodeInfo

        /**
         The phone number of the user, in international format
         */
        public var phoneNumber: String

        /**
         Pass true if the authentication code may be sent via flash call to the specified phone number
         */
        public var allowFlashCall: Bool

        /**
         Pass true if the phone number is used on the current device. Ignored if allow_flash_call is false
         */
        public var isCurrentPhoneNumber: Bool

        /**
         Sends a code to verify a phone number to be added to a user's Telegram Passport

         - Parameter phoneNumber: The phone number of the user, in international format
         - Parameter allowFlashCall: Pass true if the authentication code may be sent via flash call to the specified phone number
         - Parameter isCurrentPhoneNumber: Pass true if the phone number is used on the current device. Ignored if allow_flash_call is false
         */
        public init(phoneNumber: String, allowFlashCall: Bool, isCurrentPhoneNumber: Bool) {
            self.phoneNumber = phoneNumber
            self.allowFlashCall = allowFlashCall
            self.isCurrentPhoneNumber = isCurrentPhoneNumber
        }
    }
}
