//
//  ResetNetworkStatistics.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Resets all network data usage statistics to zero. Can be called before authorization

     - ReturnType: `TDObject.Ok`
     */
    struct ResetNetworkStatistics: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Resets all network data usage statistics to zero. Can be called before authorization
         */
        public init() {}
    }
}
