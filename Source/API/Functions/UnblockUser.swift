//
//  UnblockUser.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
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
        public let userId: Int

        /**
         Removes a user from the blacklist

         - Parameter userId: User identifier
         */
        public init(userId: Int) {
            self.userId = userId
        }
    }
}
