//
//  GetUser.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns information about a user by their identifier. This is an offline request if the current user is not a bot

     - ReturnType: `TDObject.User`
     */
    struct GetUser: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.User

        /**
         User identifier
         */
        public let userId: Int

        /**
         Returns information about a user by their identifier. This is an offline request if the current user is not a bot

         - Parameter userId: User identifier
         */
        public init(userId: Int) {
            self.userId = userId
        }
    }
}
