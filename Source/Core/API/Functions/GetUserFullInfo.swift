//
//  GetUserFullInfo.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns full information about a user by their identifier

     - ReturnType: `TDObject.UserFullInfo`
     */
    struct GetUserFullInfo: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.UserFullInfo

        /**
         User identifier
         */
        public var userId: Int

        /**
         Returns full information about a user by their identifier

         - Parameter userId: User identifier
         */
        public init(userId: Int) {
            self.userId = userId
        }
    }
}
