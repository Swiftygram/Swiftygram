//
//  UpdateChatOrder.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     The order of the chat in the chat list has changed. Instead of this update updateChatLastMessage, updateChatIsPinned or updateChatDraftMessage might be sent
     */
    struct UpdateChatOrder: TDObject.Update {
        /**
         Chat identifier
         */
        public let chatId: Int64

        /**
         New value of the order
         */
        public let order: Int64

        /**
         The order of the chat in the chat list has changed. Instead of this update updateChatLastMessage, updateChatIsPinned or updateChatDraftMessage might be sent

         - Parameter chatId: Chat identifier
         - Parameter order: New value of the order
         */
        public init(chatId: Int64, order: Int64) {
            self.chatId = chatId
            self.order = order
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            order = try container.decodeInt64(forKey: .init(string: "order"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encodeInt64(order, forKey: .init(string: "order"))
        }
    }
}
