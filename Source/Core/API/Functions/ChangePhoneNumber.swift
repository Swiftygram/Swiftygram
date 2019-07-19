//
//  ChangePhoneNumber.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Changes the phone number of the user and sends an authentication code to the user's new phone number. On success, returns information about the sent code

     - ReturnType: `TDObject.AuthenticationCodeInfo`
     */
    struct ChangePhoneNumber: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.AuthenticationCodeInfo

        /**
         The new phone number of the user in international format
         */
        public var phoneNumber: String

        /**
         Pass true if the code can be sent via flash call to the specified phone number
         */
        public var allowFlashCall: Bool

        /**
         Pass true if the phone number is used on the current device. Ignored if allow_flash_call is false
         */
        public var isCurrentPhoneNumber: Bool

        /**
         Changes the phone number of the user and sends an authentication code to the user's new phone number. On success, returns information about the sent code

         - Parameter phoneNumber: The new phone number of the user in international format
         - Parameter allowFlashCall: Pass true if the code can be sent via flash call to the specified phone number
         - Parameter isCurrentPhoneNumber: Pass true if the phone number is used on the current device. Ignored if allow_flash_call is false
         */
        public init(phoneNumber: String, allowFlashCall: Bool, isCurrentPhoneNumber: Bool) {
            self.phoneNumber = phoneNumber
            self.allowFlashCall = allowFlashCall
            self.isCurrentPhoneNumber = isCurrentPhoneNumber
        }
    }
}
