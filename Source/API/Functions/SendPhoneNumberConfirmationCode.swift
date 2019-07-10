//
//  SendPhoneNumberConfirmationCode.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Sends phone number confirmation code. Should be called when user presses "https://t.me/confirmphone?phone=*******&hash=**********" or "tg://confirmphone?phone=*******&hash=**********" link

     - ReturnType: `TDObject.AuthenticationCodeInfo`
     */
    struct SendPhoneNumberConfirmationCode: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.AuthenticationCodeInfo

        /**
         Value of the "hash" parameter from the link
         */
        public var hash: String

        /**
         Value of the "phone" parameter from the link
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
         Sends phone number confirmation code. Should be called when user presses "https://t.me/confirmphone?phone=*******&hash=**********" or "tg://confirmphone?phone=*******&hash=**********" link

         - Parameter hash: Value of the "hash" parameter from the link
         - Parameter phoneNumber: Value of the "phone" parameter from the link
         - Parameter allowFlashCall: Pass true if the authentication code may be sent via flash call to the specified phone number
         - Parameter isCurrentPhoneNumber: Pass true if the phone number is used on the current device. Ignored if allow_flash_call is false
         */
        public init(hash: String, phoneNumber: String, allowFlashCall: Bool, isCurrentPhoneNumber: Bool) {
            self.hash = hash
            self.phoneNumber = phoneNumber
            self.allowFlashCall = allowFlashCall
            self.isCurrentPhoneNumber = isCurrentPhoneNumber
        }
    }
}
