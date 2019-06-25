//
//  UpdateChatLastMessage.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     The last message of a chat was changed. If last_message is null then the last message in the chat became unknown. Some new unknown messages might be added to the chat in this case
     */
    struct UpdateChatLastMessage: TDObject.Update {
        /**
         Chat identifier
         */
        public let chatId: Int64

        /**
         The new last message in the chat; may be null
         */
        public let lastMessage: TDObject.Message

        /**
         New value of the chat order
         */
        public let order: Int64

        /**
         The last message of a chat was changed. If last_message is null then the last message in the chat became unknown. Some new unknown messages might be added to the chat in this case

         - Parameter chatId: Chat identifier
         - Parameter lastMessage: The new last message in the chat; may be null
         - Parameter order: New value of the chat order
         */
        public init(chatId: Int64, lastMessage: TDObject.Message, order: Int64) {
            self.chatId = chatId
            self.lastMessage = lastMessage
            self.order = order
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            lastMessage = try container.decode(TDObject.Message.self, forKey: .init(string: "lastMessage"))
            order = try container.decodeInt64(forKey: .init(string: "order"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encode(lastMessage, forKey: .init(string: "lastMessage"))
            try container.encodeInt64(order, forKey: .init(string: "order"))
        }
    }
}
