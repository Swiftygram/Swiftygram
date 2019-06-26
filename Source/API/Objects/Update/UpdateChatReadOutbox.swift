//
//  UpdateChatReadOutbox.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Outgoing messages were read
     */
    struct UpdateChatReadOutbox: TDObject.Update {
        /**
         Chat identifier
         */
        public let chatId: Int64

        /**
         Identifier of last read outgoing message
         */
        public let lastReadOutboxMessageId: Int64

        /**
         Outgoing messages were read

         - Parameter chatId: Chat identifier
         - Parameter lastReadOutboxMessageId: Identifier of last read outgoing message
         */
        public init(chatId: Int64, lastReadOutboxMessageId: Int64) {
            self.chatId = chatId
            self.lastReadOutboxMessageId = lastReadOutboxMessageId
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            lastReadOutboxMessageId = try container.decodeInt64(forKey: .init(string: "lastReadOutboxMessageId"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encodeInt64(lastReadOutboxMessageId, forKey: .init(string: "lastReadOutboxMessageId"))
        }
    }
}
