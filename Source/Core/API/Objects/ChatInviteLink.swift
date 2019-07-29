//
//  ChatInviteLink.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains a chat invite link
     */
    struct ChatInviteLink: TDObjectProtocol {
        /**
         Chat invite link
         */
        public var inviteLink: String

        /**
         Contains a chat invite link

         - Parameter inviteLink: Chat invite link
         */
        public init(inviteLink: String) {
            self.inviteLink = inviteLink
        }
    }
}
