//
//  TestCallVectorString.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns the received vector of strings; for testing only. This is an offline method. Can be called before authorization

     - ReturnType: `TDObject.TestVectorString`
     */
    struct TestCallVectorString: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.TestVectorString

        /**
         Vector of strings to return
         */
        public let x: [String]

        /**
         Returns the received vector of strings; for testing only. This is an offline method. Can be called before authorization

         - Parameter x: Vector of strings to return
         */
        public init(x: [String]) {
            self.x = x
        }
    }
}
