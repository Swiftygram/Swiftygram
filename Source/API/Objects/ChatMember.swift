//
//  ChatMember.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     A user with information about joining/leaving a chat
     */
    struct ChatMember: TDObjectProtocol {
        /**
         User identifier of the chat member
         */
        public let userId: Int

        /**
         Identifier of a user that invited/promoted/banned this member in the chat; 0 if unknown
         */
        public let inviterUserId: Int

        /**
         Point in time (Unix timestamp) when the user joined a chat
         */
        public let joinedChatDate: Foundation.Date

        /**
         Status of the member in the chat
         */
        public let status: TDEnum.ChatMemberStatus

        /**
         If the user is a bot, information about the bot; may be null. Can be null even for a bot if the bot is not a chat member
         */
        public let botInfo: TDObject.BotInfo

        /**
         A user with information about joining/leaving a chat

         - Parameter userId: User identifier of the chat member
         - Parameter inviterUserId: Identifier of a user that invited/promoted/banned this member in the chat; 0 if unknown
         - Parameter joinedChatDate: Point in time (Unix timestamp) when the user joined a chat
         - Parameter status: Status of the member in the chat
         - Parameter botInfo: If the user is a bot, information about the bot; may be null. Can be null even for a bot if the bot is not a chat member
         */
        public init(userId: Int, inviterUserId: Int, joinedChatDate: Foundation.Date, status: TDEnum.ChatMemberStatus, botInfo: TDObject.BotInfo) {
            self.userId = userId
            self.inviterUserId = inviterUserId
            self.joinedChatDate = joinedChatDate
            self.status = status
            self.botInfo = botInfo
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            userId = try container.decode(Int.self, forKey: .init(string: "userId"))
            inviterUserId = try container.decode(Int.self, forKey: .init(string: "inviterUserId"))
            joinedChatDate = try container.decodeDate(forKey: .init(string: "joinedChatDate"))
            status = try container.decode(TDEnum.ChatMemberStatus.self, forKey: .init(string: "status"))
            botInfo = try container.decode(TDObject.BotInfo.self, forKey: .init(string: "botInfo"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encode(userId, forKey: .init(string: "userId"))
            try container.encode(inviterUserId, forKey: .init(string: "inviterUserId"))
            try container.encodeDate(joinedChatDate, forKey: .init(string: "joinedChatDate"))
            try container.encode(status, forKey: .init(string: "status"))
            try container.encode(botInfo, forKey: .init(string: "botInfo"))
        }
    }
}
