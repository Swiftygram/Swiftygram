//
//  UpdateMessageContent.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     The message content has changed
     */
    struct UpdateMessageContent: TDObject.Update {
        /**
         Chat identifier
         */
        public var chatId: Int64

        /**
         Message identifier
         */
        public var messageId: Int64

        /**
         New message content
         */
        public var newContent: TDEnum.MessageContent

        /**
         The message content has changed

         - Parameter chatId: Chat identifier
         - Parameter messageId: Message identifier
         - Parameter newContent: New message content
         */
        public init(chatId: Int64, messageId: Int64, newContent: TDEnum.MessageContent) {
            self.chatId = chatId
            self.messageId = messageId
            self.newContent = newContent
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            messageId = try container.decodeInt64(forKey: .init(string: "messageId"))
            newContent = try container.decode(TDEnum.MessageContent.self, forKey: .init(string: "newContent"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encodeInt64(messageId, forKey: .init(string: "messageId"))
            try container.encode(newContent, forKey: .init(string: "newContent"))
        }
    }
}
