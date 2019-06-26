//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
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
        public var statistics: String

        /**
         Contains database statistics

         - Parameter statistics: Database statistics in an unspecified human-readable format
         */
        public init(statistics: String) {
            self.statistics = statistics
        }
    }
}
