//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains information about a Telegram Passport element that was requested by a service
     */
    struct PassportSuitableElement: TDObjectProtocol {
        /**
         Type of the element
         */
        public var type: TDEnum.PassportElementType

        /**
         True, if a selfie is required with the identity document
         */
        public var isSelfieRequired: Bool

        /**
         True, if a certified English translation is required with the document
         */
        public var isTranslationRequired: Bool

        /**
         True, if personal details must include the user's name in the language of their country of residence
         */
        public var isNativeNameRequired: Bool

        /**
         Contains information about a Telegram Passport element that was requested by a service

         - Parameter type: Type of the element
         - Parameter isSelfieRequired: True, if a selfie is required with the identity document
         - Parameter isTranslationRequired: True, if a certified English translation is required with the document
         - Parameter isNativeNameRequired: True, if personal details must include the user's name in the language of their country of residence
         */
        public init(type: TDEnum.PassportElementType, isSelfieRequired: Bool, isTranslationRequired: Bool, isNativeNameRequired: Bool) {
            self.type = type
            self.isSelfieRequired = isSelfieRequired
            self.isTranslationRequired = isTranslationRequired
            self.isNativeNameRequired = isNativeNameRequired
        }
    }
}
