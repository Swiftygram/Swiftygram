//
//  UpdateUserStatus.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     The user went online or offline
     */
    struct UpdateUserStatus: TDObject.Update {
        /**
         User identifier
         */
        public var userId: Int

        /**
         New status of the user
         */
        public var status: TDEnum.UserStatus

        /**
         The user went online or offline

         - Parameter userId: User identifier
         - Parameter status: New status of the user
         */
        public init(userId: Int, status: TDEnum.UserStatus) {
            self.userId = userId
            self.status = status
        }
    }
}
