//
//  StopPoll.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Stops a poll. A poll in a message can be stopped when the message has can_be_edited flag set

     - ReturnType: `TDObject.Ok`
     */
    struct StopPoll: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Identifier of the chat to which the poll belongs
         */
        public var chatId: Int64

        /**
         Identifier of the message containing the poll
         */
        public var messageId: Int64

        /**
         The new message reply markup; for bots only
         */
        public var replyMarkup: TDEnum.ReplyMarkup

        /**
         Stops a poll. A poll in a message can be stopped when the message has can_be_edited flag set

         - Parameter chatId: Identifier of the chat to which the poll belongs
         - Parameter messageId: Identifier of the message containing the poll
         - Parameter replyMarkup: The new message reply markup; for bots only
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
