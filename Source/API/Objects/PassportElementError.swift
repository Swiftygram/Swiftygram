//
//  PassportElementError.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains the description of an error in a Telegram Passport element
     */
    struct PassportElementError: TDObjectProtocol {
        /**
         Type of the Telegram Passport element which has the error
         */
        public let type: TDEnum.PassportElementType

        /**
         Error message
         */
        public let message: String

        /**
         Error source
         */
        public let source: TDEnum.PassportElementErrorSource

        /**
         Contains the description of an error in a Telegram Passport element

         - Parameter type: Type of the Telegram Passport element which has the error
         - Parameter message: Error message
         - Parameter source: Error source
         */
        public init(type: TDEnum.PassportElementType, message: String, source: TDEnum.PassportElementErrorSource) {
            self.type = type
            self.message = message
            self.source = source
        }
    }
}
