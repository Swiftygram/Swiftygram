//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Resends the 2-step verification recovery email address verification code

     - ReturnType: `TDObject.PasswordState`
     */
    struct ResendRecoveryEmailAddressCode: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.PasswordState

        /**
         Resends the 2-step verification recovery email address verification code
         */
        public init() {}
    }
}
