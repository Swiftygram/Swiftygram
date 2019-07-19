//
//  TestInt.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     A simple object containing a number; for testing only
     */
    struct TestInt: TDObjectProtocol {
        /**
         Number
         */
        public var value: Int

        /**
         A simple object containing a number; for testing only

         - Parameter value: Number
         */
        public init(value: Int) {
            self.value = value
        }
    }
}
