//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains a value representing a number of seconds
     */
    struct Seconds: TDObjectProtocol {
        /**
         Number of seconds
         */
        public var seconds: Double

        /**
         Contains a value representing a number of seconds

         - Parameter seconds: Number of seconds
         */
        public init(seconds: Double) {
            self.seconds = seconds
        }
    }
}
