//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Resends phone number confirmation code

     - ReturnType: `TDObject.AuthenticationCodeInfo`
     */
    struct ResendPhoneNumberConfirmationCode: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.AuthenticationCodeInfo

        /**
         Resends phone number confirmation code
         */
        public init() {}
    }
}
