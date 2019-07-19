//
//  SetAccountTtl.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Changes the period of inactivity after which the account of the current user will automatically be deleted

     - ReturnType: `TDObject.Ok`
     */
    struct SetAccountTtl: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         New account TTL
         */
        public var ttl: TDObject.AccountTtl

        /**
         Changes the period of inactivity after which the account of the current user will automatically be deleted

         - Parameter ttl: New account TTL
         */
        public init(ttl: TDObject.AccountTtl) {
            self.ttl = ttl
        }
    }
}
