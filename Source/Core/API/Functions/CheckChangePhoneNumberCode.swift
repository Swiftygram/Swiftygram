//
//  CheckChangePhoneNumberCode.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Checks the authentication code sent to confirm a new phone number of the user

     - ReturnType: `TDObject.Ok`
     */
    struct CheckChangePhoneNumberCode: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Verification code received by SMS, phone call or flash call
         */
        public var code: String

        /**
         Checks the authentication code sent to confirm a new phone number of the user

         - Parameter code: Verification code received by SMS, phone call or flash call
         */
        public init(code: String) {
            self.code = code
        }
    }
}
