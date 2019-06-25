//
//  TestCallBytes.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns the received bytes; for testing only. This is an offline method. Can be called before authorization

     - ReturnType: `TDObject.TestBytes`
     */
    struct TestCallBytes: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.TestBytes

        /**
         Bytes to return
         */
        public let x: String

        /**
         Returns the received bytes; for testing only. This is an offline method. Can be called before authorization

         - Parameter x: Bytes to return
         */
        public init(x: String) {
            self.x = x
        }
    }
}
