//
//  BasicGroup.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Represents a basic group of 0-200 users (must be upgraded to a supergroup to accommodate more than 200 users)
     */
    struct BasicGroup: TDObjectProtocol {
        /**
         Group identifier
         */
        public var id: Int

        /**
         Number of members in the group
         */
        public var memberCount: Int

        /**
         Status of the current user in the group
         */
        public var status: TDEnum.ChatMemberStatus

        /**
         True, if all members have been granted administrator rights in the group
         */
        public var everyoneIsAdministrator: Bool

        /**
         True, if the group is active
         */
        public var isActive: Bool

        /**
         Identifier of the supergroup to which this group was upgraded; 0 if none
         */
        public var upgradedToSupergroupId: Int

        /**
         Represents a basic group of 0-200 users (must be upgraded to a supergroup to accommodate more than 200 users)

         - Parameter id: Group identifier
         - Parameter memberCount: Number of members in the group
         - Parameter status: Status of the current user in the group
         - Parameter everyoneIsAdministrator: True, if all members have been granted administrator rights in the group
         - Parameter isActive: True, if the group is active
         - Parameter upgradedToSupergroupId: Identifier of the supergroup to which this group was upgraded; 0 if none
         */
        public init(id: Int, memberCount: Int, status: TDEnum.ChatMemberStatus, everyoneIsAdministrator: Bool, isActive: Bool, upgradedToSupergroupId: Int) {
            self.id = id
            self.memberCount = memberCount
            self.status = status
            self.everyoneIsAdministrator = everyoneIsAdministrator
            self.isActive = isActive
            self.upgradedToSupergroupId = upgradedToSupergroupId
        }
    }
}
