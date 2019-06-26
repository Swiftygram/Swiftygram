//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Adds the specified data to data usage statistics. Can be called before authorization

     - ReturnType: `TDObject.Ok`
     */
    struct AddNetworkStatistics: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         The network statistics entry with the data to be added to statistics
         */
        public var entry: TDEnum.NetworkStatisticsEntry

        /**
         Adds the specified data to data usage statistics. Can be called before authorization

         - Parameter entry: The network statistics entry with the data to be added to statistics
         */
        public init(entry: TDEnum.NetworkStatisticsEntry) {
            self.entry = entry
        }
    }
}
