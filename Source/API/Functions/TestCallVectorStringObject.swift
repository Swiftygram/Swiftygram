//
//  TestCallVectorStringObject.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns the received vector of objects containing a string; for testing only. This is an offline method. Can be called before authorization

     - ReturnType: `TDObject.TestVectorStringObject`
     */
    struct TestCallVectorStringObject: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.TestVectorStringObject

        /**
         Vector of objects to return
         */
        public let x: [TDObject.TestString]

        /**
         Returns the received vector of objects containing a string; for testing only. This is an offline method. Can be called before authorization

         - Parameter x: Vector of objects to return
         */
        public init(x: [TDObject.TestString]) {
            self.x = x
        }
    }
}
