//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Checks phone number confirmation code

     - ReturnType: `TDObject.Ok`
     */
    struct CheckPhoneNumberConfirmationCode: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         The phone number confirmation code
         */
        public var code: String

        /**
         Checks phone number confirmation code

         - Parameter code: The phone number confirmation code
         */
        public init(code: String) {
            self.code = code
        }
    }
}
