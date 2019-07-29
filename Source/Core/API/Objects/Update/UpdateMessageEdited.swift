//
//  UpdateMessageEdited.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     A message was edited. Changes in the message content will come in a separate updateMessageContent
     */
    struct UpdateMessageEdited: TDObject.Update {
        /**
         Chat identifier
         */
        public var chatId: Int64

        /**
         Message identifier
         */
        public var messageId: Int64

        /**
         Point in time (Unix timestamp) when the message was edited
         */
        public var editDate: Foundation.Date

        /**
         New message reply markup; may be null
         */
        public var replyMarkup: TDEnum.ReplyMarkup?

        /**
         A message was edited. Changes in the message content will come in a separate updateMessageContent

         - Parameter chatId: Chat identifier
         - Parameter messageId: Message identifier
         - Parameter editDate: Point in time (Unix timestamp) when the message was edited
         - Parameter replyMarkup: New message reply markup; may be null
         */
        public init(chatId: Int64, messageId: Int64, editDate: Foundation.Date, replyMarkup: TDEnum.ReplyMarkup?) {
            self.chatId = chatId
            self.messageId = messageId
            self.editDate = editDate
            self.replyMarkup = replyMarkup
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            messageId = try container.decodeInt64(forKey: .init(string: "messageId"))
            editDate = try container.decodeDate(forKey: .init(string: "editDate"))
            replyMarkup = try container.decodeIfPresent(TDEnum.ReplyMarkup.self, forKey: .init(string: "replyMarkup"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encodeInt64(messageId, forKey: .init(string: "messageId"))
            try container.encodeDate(editDate, forKey: .init(string: "editDate"))
            try container.encodeIfPresent(replyMarkup, forKey: .init(string: "replyMarkup"))
        }
    }
}
