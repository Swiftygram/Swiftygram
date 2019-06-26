//
//  UpdateChatDraftMessage.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     A chat draft has changed. Be aware that the update may come in the currently opened chat but with old content of the draft. If the user has changed the content of the draft, this update shouldn't be applied
     */
    struct UpdateChatDraftMessage: TDObject.Update {
        /**
         Chat identifier
         */
        public let chatId: Int64

        /**
         The new draft message; may be null
         */
        public let draftMessage: TDObject.DraftMessage

        /**
         New value of the chat order
         */
        public let order: Int64

        /**
         A chat draft has changed. Be aware that the update may come in the currently opened chat but with old content of the draft. If the user has changed the content of the draft, this update shouldn't be applied

         - Parameter chatId: Chat identifier
         - Parameter draftMessage: The new draft message; may be null
         - Parameter order: New value of the chat order
         */
        public init(chatId: Int64, draftMessage: TDObject.DraftMessage, order: Int64) {
            self.chatId = chatId
            self.draftMessage = draftMessage
            self.order = order
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            draftMessage = try container.decode(TDObject.DraftMessage.self, forKey: .init(string: "draftMessage"))
            order = try container.decodeInt64(forKey: .init(string: "order"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encode(draftMessage, forKey: .init(string: "draftMessage"))
            try container.encodeInt64(order, forKey: .init(string: "order"))
        }
    }
}
