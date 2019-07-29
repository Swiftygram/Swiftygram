//
//  SetAuthenticationPhoneNumber.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

extension TDFunction {
    /**
     Sets the phone number of the user and sends an authentication code to the user. Works only when the current authorization state is authorizationStateWaitPhoneNumber

     - ReturnType: `TDObject.Ok`
     */
    struct SetAuthenticationPhoneNumber: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

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
         Sets the phone number of the user and sends an authentication code to the user. Works only when the current authorization state is authorizationStateWaitPhoneNumber

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
