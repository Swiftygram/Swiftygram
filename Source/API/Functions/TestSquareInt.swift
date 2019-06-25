//
//  TestSquareInt.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns the squared received number; for testing only. This is an offline method. Can be called before authorization

     - ReturnType: `TDObject.TestInt`
     */
    struct TestSquareInt: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.TestInt

        /**
         Number to square
         */
        public let x: Int

        /**
         Returns the squared received number; for testing only. This is an offline method. Can be called before authorization

         - Parameter x: Number to square
         */
        public init(x: Int) {
            self.x = x
        }
    }
}
