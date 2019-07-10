//
//  GetBlockedUsers.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns users that were blocked by the current user

     - ReturnType: `TDObject.Users`
     */
    struct GetBlockedUsers: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Users

        /**
         Number of users to skip in the result; must be non-negative
         */
        public var offset: Int

        /**
         Maximum number of users to return; up to 100
         */
        public var limit: Int

        /**
         Returns users that were blocked by the current user

         - Parameter offset: Number of users to skip in the result; must be non-negative
         - Parameter limit: Maximum number of users to return; up to 100
         */
        public init(offset: Int, limit: Int) {
            self.offset = offset
            self.limit = limit
        }
    }
}
