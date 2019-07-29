//
//  GetStorageStatisticsFast.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Quickly returns approximate storage usage statistics. Can be called before authorization

     - ReturnType: `TDObject.StorageStatisticsFast`
     */
    struct GetStorageStatisticsFast: TDFunctionProtocol, AuthorizationIndependentFunction {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.StorageStatisticsFast

        /**
         Quickly returns approximate storage usage statistics. Can be called before authorization
         */
        public init() {}
    }
}
