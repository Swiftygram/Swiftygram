//
//  CheckAuthenticationPassword.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Checks the authentication password for correctness. Works only when the current authorization state is authorizationStateWaitPassword

     - ReturnType: `TDObject.Ok`
     */
    struct CheckAuthenticationPassword: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         The password to check
         */
        public let password: String

        /**
         Checks the authentication password for correctness. Works only when the current authorization state is authorizationStateWaitPassword

         - Parameter password: The password to check
         */
        public init(password: String) {
            self.password = password
        }
    }
}
