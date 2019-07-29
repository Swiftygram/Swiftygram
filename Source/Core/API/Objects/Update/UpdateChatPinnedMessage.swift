//
//  UpdateChatPinnedMessage.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     The chat pinned message was changed
     */
    struct UpdateChatPinnedMessage: TDObject.Update {
        /**
         Chat identifier
         */
        public var chatId: Int64

        /**
         The new identifier of the pinned message; 0 if there is no pinned message in the chat
         */
        public var pinnedMessageId: Int64

        /**
         The chat pinned message was changed

         - Parameter chatId: Chat identifier
         - Parameter pinnedMessageId: The new identifier of the pinned message; 0 if there is no pinned message in the chat
         */
        public init(chatId: Int64, pinnedMessageId: Int64) {
            self.chatId = chatId
            self.pinnedMessageId = pinnedMessageId
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            pinnedMessageId = try container.decodeInt64(forKey: .init(string: "pinnedMessageId"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encodeInt64(pinnedMessageId, forKey: .init(string: "pinnedMessageId"))
        }
    }
}
