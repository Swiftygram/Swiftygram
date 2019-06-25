//
//  SetPassportElement.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Adds an element to the user's Telegram Passport. May return an error with a message "PHONE_VERIFICATION_NEEDED" or "EMAIL_VERIFICATION_NEEDED" if the chosen phone number or the chosen email address must be verified first

     - ReturnType: `TDEnum.PassportElement`
     */
    struct SetPassportElement: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDEnum.PassportElement

        /**
         Input Telegram Passport element
         */
        public let element: TDEnum.InputPassportElement

        /**
         Password of the current user
         */
        public let password: String

        /**
         Adds an element to the user's Telegram Passport. May return an error with a message "PHONE_VERIFICATION_NEEDED" or "EMAIL_VERIFICATION_NEEDED" if the chosen phone number or the chosen email address must be verified first

         - Parameter element: Input Telegram Passport element
         - Parameter password: Password of the current user
         */
        public init(element: TDEnum.InputPassportElement, password: String) {
            self.element = element
            self.password = password
        }
    }
}
