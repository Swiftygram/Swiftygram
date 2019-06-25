//
//  TestVectorInt.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     A simple object containing a vector of numbers; for testing only
     */
    struct TestVectorInt: TDObjectProtocol {
        /**
         Vector of numbers
         */
        public let value: [Int]

        /**
         A simple object containing a vector of numbers; for testing only

         - Parameter value: Vector of numbers
         */
        public init(value: [Int]) {
            self.value = value
        }
    }
}
