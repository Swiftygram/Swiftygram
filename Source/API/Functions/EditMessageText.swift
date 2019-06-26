//
//  EditMessageText.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Edits the text of a message (or a text of a game message). Returns the edited message after the edit is completed on the server side

     - ReturnType: `TDObject.Message`
     */
    struct EditMessageText: TDFunctionProtocol {
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
         The new message reply markup; for bots only
         */
        public let replyMarkup: TDEnum.ReplyMarkup

        /**
         New text content of the message. Should be of type InputMessageText
         */
        public let inputMessageContent: TDEnum.InputMessageContent

        /**
         Edits the text of a message (or a text of a game message). Returns the edited message after the edit is completed on the server side

         - Parameter chatId: The chat the message belongs to
         - Parameter messageId: Identifier of the message
         - Parameter replyMarkup: The new message reply markup; for bots only
         - Parameter inputMessageContent: New text content of the message. Should be of type InputMessageText
         */
        public init(chatId: Int64, messageId: Int64, replyMarkup: TDEnum.ReplyMarkup, inputMessageContent: TDEnum.InputMessageContent) {
            self.chatId = chatId
            self.messageId = messageId
            self.replyMarkup = replyMarkup
            self.inputMessageContent = inputMessageContent
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            messageId = try container.decodeInt64(forKey: .init(string: "messageId"))
            replyMarkup = try container.decode(TDEnum.ReplyMarkup.self, forKey: .init(string: "replyMarkup"))
            inputMessageContent = try container.decode(TDEnum.InputMessageContent.self, forKey: .init(string: "inputMessageContent"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encodeInt64(messageId, forKey: .init(string: "messageId"))
            try container.encode(replyMarkup, forKey: .init(string: "replyMarkup"))
            try container.encode(inputMessageContent, forKey: .init(string: "inputMessageContent"))
        }
    }
}
