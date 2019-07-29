//
//  UnblockUser.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Removes a user from the blacklist

     - ReturnType: `TDObject.Ok`
     */
    struct UnblockUser: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         User identifier
         */
        public var userId: Int

        /**
         Removes a user from the blacklist

         - Parameter userId: User identifier
         */
        public init(userId: Int) {
            self.userId = userId
        }
    }
}
