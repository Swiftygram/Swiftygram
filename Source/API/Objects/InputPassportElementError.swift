//
//  InputPassportElementError.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains the description of an error in a Telegram Passport element; for bots only
     */
    struct InputPassportElementError: TDObjectProtocol {
        /**
         Type of Telegram Passport element that has the error
         */
        public let type: TDEnum.PassportElementType

        /**
         Error message
         */
        public let message: String

        /**
         Error source
         */
        public let source: TDEnum.InputPassportElementErrorSource

        /**
         Contains the description of an error in a Telegram Passport element; for bots only

         - Parameter type: Type of Telegram Passport element that has the error
         - Parameter message: Error message
         - Parameter source: Error source
         */
        public init(type: TDEnum.PassportElementType, message: String, source: TDEnum.InputPassportElementErrorSource) {
            self.type = type
            self.message = message
            self.source = source
        }
    }
}
