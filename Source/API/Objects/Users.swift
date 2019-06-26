//
//  Users.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Represents a list of users
     */
    struct Users: TDObjectProtocol {
        /**
         Approximate total count of users found
         */
        public let totalCount: Int

        /**
         A list of user identifiers
         */
        public let userIds: [Int]

        /**
         Represents a list of users

         - Parameter totalCount: Approximate total count of users found
         - Parameter userIds: A list of user identifiers
         */
        public init(totalCount: Int, userIds: [Int]) {
            self.totalCount = totalCount
            self.userIds = userIds
        }
    }
}
