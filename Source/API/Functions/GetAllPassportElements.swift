//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns all available Telegram Passport elements

     - ReturnType: `TDObject.PassportElements`
     */
    struct GetAllPassportElements: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.PassportElements

        /**
         Password of the current user
         */
        public var password: String

        /**
         Returns all available Telegram Passport elements

         - Parameter password: Password of the current user
         */
        public init(password: String) {
            self.password = password
        }
    }
}
