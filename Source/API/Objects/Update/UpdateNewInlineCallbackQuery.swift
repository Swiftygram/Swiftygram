//
//  UpdateNewInlineCallbackQuery.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     A new incoming callback query from a message sent via a bot; for bots only
     */
    struct UpdateNewInlineCallbackQuery: TDObject.Update {
        /**
         Unique query identifier
         */
        public let id: Int64

        /**
         Identifier of the user who sent the query
         */
        public let senderUserId: Int

        /**
         Identifier of the inline message, from which the query originated
         */
        public let inlineMessageId: String

        /**
         An identifier uniquely corresponding to the chat a message was sent to
         */
        public let chatInstance: Int64

        /**
         Query payload
         */
        public let payload: TDEnum.CallbackQueryPayload

        /**
         A new incoming callback query from a message sent via a bot; for bots only

         - Parameter id: Unique query identifier
         - Parameter senderUserId: Identifier of the user who sent the query
         - Parameter inlineMessageId: Identifier of the inline message, from which the query originated
         - Parameter chatInstance: An identifier uniquely corresponding to the chat a message was sent to
         - Parameter payload: Query payload
         */
        public init(id: Int64, senderUserId: Int, inlineMessageId: String, chatInstance: Int64, payload: TDEnum.CallbackQueryPayload) {
            self.id = id
            self.senderUserId = senderUserId
            self.inlineMessageId = inlineMessageId
            self.chatInstance = chatInstance
            self.payload = payload
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            id = try container.decodeInt64(forKey: .init(string: "id"))
            senderUserId = try container.decode(Int.self, forKey: .init(string: "senderUserId"))
            inlineMessageId = try container.decode(String.self, forKey: .init(string: "inlineMessageId"))
            chatInstance = try container.decodeInt64(forKey: .init(string: "chatInstance"))
            payload = try container.decode(TDEnum.CallbackQueryPayload.self, forKey: .init(string: "payload"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(id, forKey: .init(string: "id"))
            try container.encode(senderUserId, forKey: .init(string: "senderUserId"))
            try container.encode(inlineMessageId, forKey: .init(string: "inlineMessageId"))
            try container.encodeInt64(chatInstance, forKey: .init(string: "chatInstance"))
            try container.encode(payload, forKey: .init(string: "payload"))
        }
    }
}
