//
//  UpdateNewCallbackQuery.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     A new incoming callback query; for bots only
     */
    struct UpdateNewCallbackQuery: TDObject.Update {
        /**
         Unique query identifier
         */
        public let id: Int64

        /**
         Identifier of the user who sent the query
         */
        public let senderUserId: Int

        /**
         Identifier of the chat, in which the query was sent
         */
        public let chatId: Int64

        /**
         Identifier of the message, from which the query originated
         */
        public let messageId: Int64

        /**
         Identifier that uniquely corresponds to the chat to which the message was sent
         */
        public let chatInstance: Int64

        /**
         Query payload
         */
        public let payload: TDEnum.CallbackQueryPayload

        /**
         A new incoming callback query; for bots only

         - Parameter id: Unique query identifier
         - Parameter senderUserId: Identifier of the user who sent the query
         - Parameter chatId: Identifier of the chat, in which the query was sent
         - Parameter messageId: Identifier of the message, from which the query originated
         - Parameter chatInstance: Identifier that uniquely corresponds to the chat to which the message was sent
         - Parameter payload: Query payload
         */
        public init(id: Int64, senderUserId: Int, chatId: Int64, messageId: Int64, chatInstance: Int64, payload: TDEnum.CallbackQueryPayload) {
            self.id = id
            self.senderUserId = senderUserId
            self.chatId = chatId
            self.messageId = messageId
            self.chatInstance = chatInstance
            self.payload = payload
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            id = try container.decodeInt64(forKey: .init(string: "id"))
            senderUserId = try container.decode(Int.self, forKey: .init(string: "senderUserId"))
            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            messageId = try container.decodeInt64(forKey: .init(string: "messageId"))
            chatInstance = try container.decodeInt64(forKey: .init(string: "chatInstance"))
            payload = try container.decode(TDEnum.CallbackQueryPayload.self, forKey: .init(string: "payload"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(id, forKey: .init(string: "id"))
            try container.encode(senderUserId, forKey: .init(string: "senderUserId"))
            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encodeInt64(messageId, forKey: .init(string: "messageId"))
            try container.encodeInt64(chatInstance, forKey: .init(string: "chatInstance"))
            try container.encode(payload, forKey: .init(string: "payload"))
        }
    }
}
