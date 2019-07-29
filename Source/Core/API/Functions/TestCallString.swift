//
//  TestCallString.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns the received string; for testing only. This is an offline method. Can be called before authorization

     - ReturnType: `TDObject.TestString`
     */
    struct TestCallString: TDFunctionProtocol, AuthorizationIndependentFunction {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.TestString

        /**
         String to return
         */
        public var x: String

        /**
         Returns the received string; for testing only. This is an offline method. Can be called before authorization

         - Parameter x: String to return
         */
        public init(x: String) {
            self.x = x
        }
    }
}
