//
//  GetMe.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns the current user

     - ReturnType: `TDObject.User`
     */
    struct GetMe: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.User

        /**
         Returns the current user
         */
        public init() {}
    }
}
