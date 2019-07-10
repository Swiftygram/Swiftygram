//
//  TestNetwork.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Sends a simple network request to the Telegram servers; for testing only. Can be called before authorization

     - ReturnType: `TDObject.Ok`
     */
    struct TestNetwork: TDFunctionProtocol, AuthorizationIndependentFunction {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Sends a simple network request to the Telegram servers; for testing only. Can be called before authorization
         */
        public init() {}
    }
}
