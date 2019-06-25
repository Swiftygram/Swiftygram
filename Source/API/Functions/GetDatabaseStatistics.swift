//
//  GetDatabaseStatistics.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
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
