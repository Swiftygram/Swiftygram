//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
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
        public var onlyCurrent: Bool

        /**
         Returns network data usage statistics. Can be called before authorization

         - Parameter onlyCurrent: If true, returns only data for the current library launch
         */
        public init(onlyCurrent: Bool) {
            self.onlyCurrent = onlyCurrent
        }
    }
}
