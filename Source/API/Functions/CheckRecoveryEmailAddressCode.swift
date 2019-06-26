//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Checks the 2-step verification recovery email address verification code

     - ReturnType: `TDObject.PasswordState`
     */
    struct CheckRecoveryEmailAddressCode: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.PasswordState

        /**
         Verification code
         */
        public var code: String

        /**
         Checks the 2-step verification recovery email address verification code

         - Parameter code: Verification code
         */
        public init(code: String) {
            self.code = code
        }
    }
}
