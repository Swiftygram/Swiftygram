//
//  JoinChatByInviteLink.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Uses an invite link to add the current user to the chat if possible. The new member will not be added until the chat state has been synchronized with the server

     - ReturnType: `TDObject.Chat`
     */
    struct JoinChatByInviteLink: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Chat

        /**
         Invite link to import; should begin with "https://t.me/joinchat/", "https://telegram.me/joinchat/", or "https://telegram.dog/joinchat/"
         */
        public var inviteLink: String

        /**
         Uses an invite link to add the current user to the chat if possible. The new member will not be added until the chat state has been synchronized with the server

         - Parameter inviteLink: Invite link to import; should begin with "https://t.me/joinchat/", "https://telegram.me/joinchat/", or "https://telegram.dog/joinchat/"
         */
        public init(inviteLink: String) {
            self.inviteLink = inviteLink
        }
    }
}
