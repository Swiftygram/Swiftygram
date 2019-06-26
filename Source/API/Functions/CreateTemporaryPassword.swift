//
//  CreateTemporaryPassword.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Creates a new temporary password for processing payments

     - ReturnType: `TDObject.TemporaryPasswordState`
     */
    struct CreateTemporaryPassword: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.TemporaryPasswordState

        /**
         Persistent user password
         */
        public let password: String

        /**
         Time during which the temporary password will be valid, in seconds; should be between 60 and 86400
         */
        public let validFor: Int

        /**
         Creates a new temporary password for processing payments

         - Parameter password: Persistent user password
         - Parameter validFor: Time during which the temporary password will be valid, in seconds; should be between 60 and 86400
         */
        public init(password: String, validFor: Int) {
            self.password = password
            self.validFor = validFor
        }
    }
}
