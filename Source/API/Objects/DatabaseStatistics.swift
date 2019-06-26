//
//  DatabaseStatistics.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains database statistics
     */
    struct DatabaseStatistics: TDObjectProtocol {
        /**
         Database statistics in an unspecified human-readable format
         */
        public let statistics: String

        /**
         Contains database statistics

         - Parameter statistics: Database statistics in an unspecified human-readable format
         */
        public init(statistics: String) {
            self.statistics = statistics
        }
    }
}
