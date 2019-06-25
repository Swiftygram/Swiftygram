//
//  GetAccountTtl.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns the period of inactivity after which the account of the current user will automatically be deleted

     - ReturnType: `TDObject.AccountTtl`
     */
    struct GetAccountTtl: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.AccountTtl

        /**
         Returns the period of inactivity after which the account of the current user will automatically be deleted
         */
        public init() {}
    }
}
