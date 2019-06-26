//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns database statistics

     - ReturnType: `TDObject.DatabaseStatistics`
     */
    struct GetDatabaseStatistics: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.DatabaseStatistics

        /**
         Returns database statistics
         */
        public init() {}
    }
}
