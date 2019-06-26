//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
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
        public var type: TDEnum.PassportElementType

        /**
         Error message
         */
        public var message: String

        /**
         Error source
         */
        public var source: TDEnum.InputPassportElementErrorSource

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
