//
//  UpdateChatReplyMarkup.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     The default chat reply markup was changed. Can occur because new messages with reply markup were received or because an old reply markup was hidden by the user
     */
    struct UpdateChatReplyMarkup: TDObject.Update {
        /**
         Chat identifier
         */
        public let chatId: Int64

        /**
         Identifier of the message from which reply markup needs to be used; 0 if there is no default custom reply markup in the chat
         */
        public let replyMarkupMessageId: Int64

        /**
         The default chat reply markup was changed. Can occur because new messages with reply markup were received or because an old reply markup was hidden by the user

         - Parameter chatId: Chat identifier
         - Parameter replyMarkupMessageId: Identifier of the message from which reply markup needs to be used; 0 if there is no default custom reply markup in the chat
         */
        public init(chatId: Int64, replyMarkupMessageId: Int64) {
            self.chatId = chatId
            self.replyMarkupMessageId = replyMarkupMessageId
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            replyMarkupMessageId = try container.decodeInt64(forKey: .init(string: "replyMarkupMessageId"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encodeInt64(replyMarkupMessageId, forKey: .init(string: "replyMarkupMessageId"))
        }
    }
}
