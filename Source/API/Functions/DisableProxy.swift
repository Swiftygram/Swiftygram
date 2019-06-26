//
//  DisableProxy.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Disables the currently enabled proxy. Can be called before authorization

     - ReturnType: `TDObject.Ok`
     */
    struct DisableProxy: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Disables the currently enabled proxy. Can be called before authorization
         */
        public init() {}
    }
}
