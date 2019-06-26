//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains a TDLib internal log verbosity level
     */
    struct LogVerbosityLevel: TDObjectProtocol {
        /**
         Log verbosity level
         */
        public var verbosityLevel: Int

        /**
         Contains a TDLib internal log verbosity level

         - Parameter verbosityLevel: Log verbosity level
         */
        public init(verbosityLevel: Int) {
            self.verbosityLevel = verbosityLevel
        }
    }
}
