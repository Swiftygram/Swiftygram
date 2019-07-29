//
//  DeleteSavedCredentials.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Deletes saved credentials for all payment provider bots

     - ReturnType: `TDObject.Ok`
     */
    struct DeleteSavedCredentials: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Deletes saved credentials for all payment provider bots
         */
        public init() {}
    }
}
