//
//  TestCallVectorInt.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns the received vector of numbers; for testing only. This is an offline method. Can be called before authorization

     - ReturnType: `TDObject.TestVectorInt`
     */
    struct TestCallVectorInt: TDFunctionProtocol, AuthorizationIndependentFunction {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.TestVectorInt

        /**
         Vector of numbers to return
         */
        public var x: [Int]

        /**
         Returns the received vector of numbers; for testing only. This is an offline method. Can be called before authorization

         - Parameter x: Vector of numbers to return
         */
        public init(x: [Int]) {
            self.x = x
        }
    }
}
