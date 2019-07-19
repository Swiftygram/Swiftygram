//
//  UpdateUserFullInfo.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Some data from userFullInfo has been changed
     */
    struct UpdateUserFullInfo: TDObject.Update {
        /**
         User identifier
         */
        public var userId: Int

        /**
         New full information about the user
         */
        public var userFullInfo: TDObject.UserFullInfo

        /**
         Some data from userFullInfo has been changed

         - Parameter userId: User identifier
         - Parameter userFullInfo: New full information about the user
         */
        public init(userId: Int, userFullInfo: TDObject.UserFullInfo) {
            self.userId = userId
            self.userFullInfo = userFullInfo
        }
    }
}
