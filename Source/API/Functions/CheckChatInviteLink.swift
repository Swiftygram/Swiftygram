//
//  CheckChatInviteLink.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Checks the validity of an invite link for a chat and returns information about the corresponding chat

     - ReturnType: `TDObject.ChatInviteLinkInfo`
     */
    struct CheckChatInviteLink: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.ChatInviteLinkInfo

        /**
         Invite link to be checked; should begin with "https://t.me/joinchat/", "https://telegram.me/joinchat/", or "https://telegram.dog/joinchat/"
         */
        public var inviteLink: String

        /**
         Checks the validity of an invite link for a chat and returns information about the corresponding chat

         - Parameter inviteLink: Invite link to be checked; should begin with "https://t.me/joinchat/", "https://telegram.me/joinchat/", or "https://telegram.dog/joinchat/"
         */
        public init(inviteLink: String) {
            self.inviteLink = inviteLink
        }
    }
}
