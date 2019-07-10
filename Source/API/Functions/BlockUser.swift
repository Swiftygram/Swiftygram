//
//  BlockUser.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Adds a user to the blacklist

     - ReturnType: `TDObject.Ok`
     */
    struct BlockUser: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         User identifier
         */
        public var userId: Int

        /**
         Adds a user to the blacklist

         - Parameter userId: User identifier
         */
        public init(userId: Int) {
            self.userId = userId
        }
    }
}
