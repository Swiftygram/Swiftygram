//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Sends a Telegram Passport authorization form, effectively sharing data with the service. This method must be called after getPassportAuthorizationFormAvailableElements if some previously available elements need to be used

     - ReturnType: `TDObject.Ok`
     */
    struct SendPassportAuthorizationForm: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Authorization form identifier
         */
        public var autorizationFormId: Int

        /**
         Types of Telegram Passport elements chosen by user to complete the authorization form
         */
        public var types: [TDEnum.PassportElementType]

        /**
         Sends a Telegram Passport authorization form, effectively sharing data with the service. This method must be called after getPassportAuthorizationFormAvailableElements if some previously available elements need to be used

         - Parameter autorizationFormId: Authorization form identifier
         - Parameter types: Types of Telegram Passport elements chosen by user to complete the authorization form
         */
        public init(autorizationFormId: Int, types: [TDEnum.PassportElementType]) {
            self.autorizationFormId = autorizationFormId
            self.types = types
        }
    }
}
