//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     A simple object containing a string; for testing only
     */
    struct TestString: TDObjectProtocol {
        /**
         String
         */
        public var value: String

        /**
         A simple object containing a string; for testing only

         - Parameter value: String
         */
        public init(value: String) {
            self.value = value
        }
    }
}
