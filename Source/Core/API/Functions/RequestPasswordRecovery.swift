//
//  RequestPasswordRecovery.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Requests to send a password recovery code to an email address that was previously set up

     - ReturnType: `TDObject.EmailAddressAuthenticationCodeInfo`
     */
    struct RequestPasswordRecovery: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.EmailAddressAuthenticationCodeInfo

        /**
         Requests to send a password recovery code to an email address that was previously set up
         */
        public init() {}
    }
}
