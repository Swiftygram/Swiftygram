//
//  UserFullInfo.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains full information about a user (except the full list of profile photos)
     */
    struct UserFullInfo: TDObjectProtocol {
        /**
         True, if the user is blacklisted by the current user
         */
        public let isBlocked: Bool

        /**
         True, if the user can be called
         */
        public let canBeCalled: Bool

        /**
         True, if the user can't be called due to their privacy settings
         */
        public let hasPrivateCalls: Bool

        /**
         A short user bio
         */
        public let bio: String

        /**
         For bots, the text that is included with the link when users share the bot
         */
        public let shareText: String

        /**
         Number of group chats where both the other user and the current user are a member; 0 for the current user
         */
        public let groupInCommonCount: Int

        /**
         If the user is a bot, information about the bot; may be null
         */
        public let botInfo: TDObject.BotInfo

        /**
         Contains full information about a user (except the full list of profile photos)

         - Parameter isBlocked: True, if the user is blacklisted by the current user
         - Parameter canBeCalled: True, if the user can be called
         - Parameter hasPrivateCalls: True, if the user can't be called due to their privacy settings
         - Parameter bio: A short user bio
         - Parameter shareText: For bots, the text that is included with the link when users share the bot
         - Parameter groupInCommonCount: Number of group chats where both the other user and the current user are a member; 0 for the current user
         - Parameter botInfo: If the user is a bot, information about the bot; may be null
         */
        public init(isBlocked: Bool, canBeCalled: Bool, hasPrivateCalls: Bool, bio: String, shareText: String, groupInCommonCount: Int, botInfo: TDObject.BotInfo) {
            self.isBlocked = isBlocked
            self.canBeCalled = canBeCalled
            self.hasPrivateCalls = hasPrivateCalls
            self.bio = bio
            self.shareText = shareText
            self.groupInCommonCount = groupInCommonCount
            self.botInfo = botInfo
        }
    }
}
