//
//  GetNetworkStatistics.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns network data usage statistics. Can be called before authorization

     - ReturnType: `TDObject.NetworkStatistics`
     */
    struct GetNetworkStatistics: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.NetworkStatistics

        /**
         If true, returns only data for the current library launch
         */
        public let onlyCurrent: Bool

        /**
         Returns network data usage statistics. Can be called before authorization

         - Parameter onlyCurrent: If true, returns only data for the current library launch
         */
        public init(onlyCurrent: Bool) {
            self.onlyCurrent = onlyCurrent
        }
    }
}
