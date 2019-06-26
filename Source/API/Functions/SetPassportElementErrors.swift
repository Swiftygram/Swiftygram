//
//  SetPassportElementErrors.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Informs the user that some of the elements in their Telegram Passport contain errors; for bots only. The user will not be able to resend the elements, until the errors are fixed

     - ReturnType: `TDObject.Ok`
     */
    struct SetPassportElementErrors: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         User identifier
         */
        public let userId: Int

        /**
         The errors
         */
        public let errors: [TDObject.InputPassportElementError]

        /**
         Informs the user that some of the elements in their Telegram Passport contain errors; for bots only. The user will not be able to resend the elements, until the errors are fixed

         - Parameter userId: User identifier
         - Parameter errors: The errors
         */
        public init(userId: Int, errors: [TDObject.InputPassportElementError]) {
            self.userId = userId
            self.errors = errors
        }
    }
}
