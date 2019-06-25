//
//  EditMessageReplyMarkup.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Edits the message reply markup; for bots only. Returns the edited message after the edit is completed on the server side

     - ReturnType: `TDObject.Message`
     */
    struct EditMessageReplyMarkup: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Message

        /**
         The chat the message belongs to
         */
        public let chatId: Int64

        /**
         Identifier of the message
         */
        public let messageId: Int64

        /**
         The new message reply markup
         */
        public let replyMarkup: TDEnum.ReplyMarkup

        /**
         Edits the message reply markup; for bots only. Returns the edited message after the edit is completed on the server side

         - Parameter chatId: The chat the message belongs to
         - Parameter messageId: Identifier of the message
         - Parameter replyMarkup: The new message reply markup
         */
        public init(chatId: Int64, messageId: Int64, replyMarkup: TDEnum.ReplyMarkup) {
            self.chatId = chatId
            self.messageId = messageId
            self.replyMarkup = replyMarkup
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            messageId = try container.decodeInt64(forKey: .init(string: "messageId"))
            replyMarkup = try container.decode(TDEnum.ReplyMarkup.self, forKey: .init(string: "replyMarkup"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encodeInt64(messageId, forKey: .init(string: "messageId"))
            try container.encode(replyMarkup, forKey: .init(string: "replyMarkup"))
        }
    }
}
