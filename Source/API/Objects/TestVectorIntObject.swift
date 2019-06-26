//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     A simple object containing a vector of objects that hold a number; for testing only
     */
    struct TestVectorIntObject: TDObjectProtocol {
        /**
         Vector of objects
         */
        public var value: [TDObject.TestInt]

        /**
         A simple object containing a vector of objects that hold a number; for testing only

         - Parameter value: Vector of objects
         */
        public init(value: [TDObject.TestInt]) {
            self.value = value
        }
    }
}
