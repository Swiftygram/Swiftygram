//
//  UpdateChatReadInbox.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Incoming messages were read or number of unread messages has been changed
     */
    struct UpdateChatReadInbox: TDObject.Update {
        /**
         Chat identifier
         */
        public let chatId: Int64

        /**
         Identifier of the last read incoming message
         */
        public let lastReadInboxMessageId: Int64

        /**
         The number of unread messages left in the chat
         */
        public let unreadCount: Int

        /**
         Incoming messages were read or number of unread messages has been changed

         - Parameter chatId: Chat identifier
         - Parameter lastReadInboxMessageId: Identifier of the last read incoming message
         - Parameter unreadCount: The number of unread messages left in the chat
         */
        public init(chatId: Int64, lastReadInboxMessageId: Int64, unreadCount: Int) {
            self.chatId = chatId
            self.lastReadInboxMessageId = lastReadInboxMessageId
            self.unreadCount = unreadCount
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            lastReadInboxMessageId = try container.decodeInt64(forKey: .init(string: "lastReadInboxMessageId"))
            unreadCount = try container.decode(Int.self, forKey: .init(string: "unreadCount"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encodeInt64(lastReadInboxMessageId, forKey: .init(string: "lastReadInboxMessageId"))
            try container.encode(unreadCount, forKey: .init(string: "unreadCount"))
        }
    }
}
