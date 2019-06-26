//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains full information about a basic group
     */
    struct BasicGroupFullInfo: TDObjectProtocol {
        /**
         User identifier of the creator of the group; 0 if unknown
         */
        public var creatorUserId: Int

        /**
         Group members
         */
        public var members: [TDObject.ChatMember]

        /**
         Invite link for this group; available only for the group creator and only after it has been generated at least once
         */
        public var inviteLink: String

        /**
         Contains full information about a basic group

         - Parameter creatorUserId: User identifier of the creator of the group; 0 if unknown
         - Parameter members: Group members
         - Parameter inviteLink: Invite link for this group; available only for the group creator and only after it has been generated at least once
         */
        public init(creatorUserId: Int, members: [TDObject.ChatMember], inviteLink: String) {
            self.creatorUserId = creatorUserId
            self.members = members
            self.inviteLink = inviteLink
        }
    }
}
