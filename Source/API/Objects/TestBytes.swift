//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     A simple object containing a sequence of bytes; for testing only
     */
    struct TestBytes: TDObjectProtocol {
        /**
         Bytes
         */
        public var value: String

        /**
         A simple object containing a sequence of bytes; for testing only

         - Parameter value: Bytes
         */
        public init(value: String) {
            self.value = value
        }
    }
}
