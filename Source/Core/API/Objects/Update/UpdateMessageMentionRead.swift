//
//  UpdateMessageMentionRead.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     A message with an unread mention was read
     */
    struct UpdateMessageMentionRead: TDObject.Update {
        /**
         Chat identifier
         */
        public var chatId: Int64

        /**
         Message identifier
         */
        public var messageId: Int64

        /**
         The new number of unread mention messages left in the chat
         */
        public var unreadMentionCount: Int

        /**
         A message with an unread mention was read

         - Parameter chatId: Chat identifier
         - Parameter messageId: Message identifier
         - Parameter unreadMentionCount: The new number of unread mention messages left in the chat
         */
        public init(chatId: Int64, messageId: Int64, unreadMentionCount: Int) {
            self.chatId = chatId
            self.messageId = messageId
            self.unreadMentionCount = unreadMentionCount
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            messageId = try container.decodeInt64(forKey: .init(string: "messageId"))
            unreadMentionCount = try container.decode(Int.self, forKey: .init(string: "unreadMentionCount"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encodeInt64(messageId, forKey: .init(string: "messageId"))
            try container.encode(unreadMentionCount, forKey: .init(string: "unreadMentionCount"))
        }
    }
}
