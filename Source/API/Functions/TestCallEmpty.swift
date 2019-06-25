//
//  TestCallEmpty.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Does nothing; for testing only. This is an offline method. Can be called before authorization

     - ReturnType: `TDObject.Ok`
     */
    struct TestCallEmpty: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Does nothing; for testing only. This is an offline method. Can be called before authorization
         */
        public init() {}
    }
}
