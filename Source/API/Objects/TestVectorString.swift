//
//  TestVectorString.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     A simple object containing a vector of strings; for testing only
     */
    struct TestVectorString: TDObjectProtocol {
        /**
         Vector of strings
         */
        public var value: [String]

        /**
         A simple object containing a vector of strings; for testing only

         - Parameter value: Vector of strings
         */
        public init(value: [String]) {
            self.value = value
        }
    }
}
