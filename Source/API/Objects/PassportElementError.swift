//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
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
        public var type: TDEnum.PassportElementType

        /**
         Error message
         */
        public var message: String

        /**
         Error source
         */
        public var source: TDEnum.PassportElementErrorSource

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
