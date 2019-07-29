//
//  UpdateChatUnreadMentionCount.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     The chat unread_mention_count has changed
     */
    struct UpdateChatUnreadMentionCount: TDObject.Update {
        /**
         Chat identifier
         */
        public var chatId: Int64

        /**
         The number of unread mention messages left in the chat
         */
        public var unreadMentionCount: Int

        /**
         The chat unread_mention_count has changed

         - Parameter chatId: Chat identifier
         - Parameter unreadMentionCount: The number of unread mention messages left in the chat
         */
        public init(chatId: Int64, unreadMentionCount: Int) {
            self.chatId = chatId
            self.unreadMentionCount = unreadMentionCount
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            unreadMentionCount = try container.decode(Int.self, forKey: .init(string: "unreadMentionCount"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encode(unreadMentionCount, forKey: .init(string: "unreadMentionCount"))
        }
    }
}
