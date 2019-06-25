//
//  GetPassportAuthorizationFormAvailableElements.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns already available Telegram Passport elements suitable for completing a Telegram Passport authorization form. Result can be received only once for each authorization form

     - ReturnType: `TDObject.PassportElementsWithErrors`
     */
    struct GetPassportAuthorizationFormAvailableElements: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.PassportElementsWithErrors

        /**
         Authorization form identifier
         */
        public let autorizationFormId: Int

        /**
         Password of the current user
         */
        public let password: String

        /**
         Returns already available Telegram Passport elements suitable for completing a Telegram Passport authorization form. Result can be received only once for each authorization form

         - Parameter autorizationFormId: Authorization form identifier
         - Parameter password: Password of the current user
         */
        public init(autorizationFormId: Int, password: String) {
            self.autorizationFormId = autorizationFormId
            self.password = password
        }
    }
}
