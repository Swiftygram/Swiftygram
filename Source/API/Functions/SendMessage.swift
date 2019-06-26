//
//  SendMessage.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Sends a message. Returns the sent message

     - ReturnType: `TDObject.Message`
     */
    struct SendMessage: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Message

        /**
         Target chat
         */
        public let chatId: Int64

        /**
         Identifier of the message to reply to or 0
         */
        public let replyToMessageId: Int64

        /**
         Pass true to disable notification for the message. Not supported in secret chats
         */
        public let disableNotification: Bool

        /**
         Pass true if the message is sent from the background
         */
        public let fromBackground: Bool

        /**
         Markup for replying to the message; for bots only
         */
        public let replyMarkup: TDEnum.ReplyMarkup

        /**
         The content of the message to be sent
         */
        public let inputMessageContent: TDEnum.InputMessageContent

        /**
         Sends a message. Returns the sent message

         - Parameter chatId: Target chat
         - Parameter replyToMessageId: Identifier of the message to reply to or 0
         - Parameter disableNotification: Pass true to disable notification for the message. Not supported in secret chats
         - Parameter fromBackground: Pass true if the message is sent from the background
         - Parameter replyMarkup: Markup for replying to the message; for bots only
         - Parameter inputMessageContent: The content of the message to be sent
         */
        public init(chatId: Int64, replyToMessageId: Int64, disableNotification: Bool, fromBackground: Bool, replyMarkup: TDEnum.ReplyMarkup, inputMessageContent: TDEnum.InputMessageContent) {
            self.chatId = chatId
            self.replyToMessageId = replyToMessageId
            self.disableNotification = disableNotification
            self.fromBackground = fromBackground
            self.replyMarkup = replyMarkup
            self.inputMessageContent = inputMessageContent
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            replyToMessageId = try container.decodeInt64(forKey: .init(string: "replyToMessageId"))
            disableNotification = try container.decode(Bool.self, forKey: .init(string: "disableNotification"))
            fromBackground = try container.decode(Bool.self, forKey: .init(string: "fromBackground"))
            replyMarkup = try container.decode(TDEnum.ReplyMarkup.self, forKey: .init(string: "replyMarkup"))
            inputMessageContent = try container.decode(TDEnum.InputMessageContent.self, forKey: .init(string: "inputMessageContent"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encodeInt64(replyToMessageId, forKey: .init(string: "replyToMessageId"))
            try container.encode(disableNotification, forKey: .init(string: "disableNotification"))
            try container.encode(fromBackground, forKey: .init(string: "fromBackground"))
            try container.encode(replyMarkup, forKey: .init(string: "replyMarkup"))
            try container.encode(inputMessageContent, forKey: .init(string: "inputMessageContent"))
        }
    }
}
