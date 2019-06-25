//
//  TestBytes.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
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
        public let value: String

        /**
         A simple object containing a sequence of bytes; for testing only

         - Parameter value: Bytes
         */
        public init(value: String) {
            self.value = value
        }
    }
}
