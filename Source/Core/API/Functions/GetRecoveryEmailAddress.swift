//
//  GetRecoveryEmailAddress.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns a 2-step verification recovery email address that was previously set up. This method can be used to verify a password provided by the user

     - ReturnType: `TDObject.RecoveryEmailAddress`
     */
    struct GetRecoveryEmailAddress: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.RecoveryEmailAddress

        /**
         The password for the current user
         */
        public var password: String

        /**
         Returns a 2-step verification recovery email address that was previously set up. This method can be used to verify a password provided by the user

         - Parameter password: The password for the current user
         */
        public init(password: String) {
            self.password = password
        }
    }
}
