//
//  AccountTtl.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains information about the period of inactivity after which the current user's account will automatically be deleted
     */
    struct AccountTtl: TDObjectProtocol {
        /**
         Number of days of inactivity before the account will be flagged for deletion; should range from 30-366 days
         */
        public var days: Int

        /**
         Contains information about the period of inactivity after which the current user's account will automatically be deleted

         - Parameter days: Number of days of inactivity before the account will be flagged for deletion; should range from 30-366 days
         */
        public init(days: Int) {
            self.days = days
        }
    }
}
