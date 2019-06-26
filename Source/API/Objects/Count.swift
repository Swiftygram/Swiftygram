//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains a counter
     */
    struct Count: TDObjectProtocol {
        /**
         Count
         */
        public var count: Int

        /**
         Contains a counter

         - Parameter count: Count
         */
        public init(count: Int) {
            self.count = count
        }
    }
}
