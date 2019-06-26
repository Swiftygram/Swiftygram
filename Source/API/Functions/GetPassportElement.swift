//
//  GetPassportElement.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns one of the available Telegram Passport elements

     - ReturnType: `TDEnum.PassportElement`
     */
    struct GetPassportElement: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDEnum.PassportElement

        /**
         Telegram Passport element type
         */
        public let type: TDEnum.PassportElementType

        /**
         Password of the current user
         */
        public let password: String

        /**
         Returns one of the available Telegram Passport elements

         - Parameter type: Telegram Passport element type
         - Parameter password: Password of the current user
         */
        public init(type: TDEnum.PassportElementType, password: String) {
            self.type = type
            self.password = password
        }
    }
}
