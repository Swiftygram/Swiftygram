//
//  GetMessageLink.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns a private HTTPS link to a message in a chat. Available only for already sent messages in supergroups and channels. The link will work only for members of the chat

     - ReturnType: `TDObject.HttpUrl`
     */
    struct GetMessageLink: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.HttpUrl

        /**
         Identifier of the chat to which the message belongs
         */
        public var chatId: Int64

        /**
         Identifier of the message
         */
        public var messageId: Int64

        /**
         Returns a private HTTPS link to a message in a chat. Available only for already sent messages in supergroups and channels. The link will work only for members of the chat

         - Parameter chatId: Identifier of the chat to which the message belongs
         - Parameter messageId: Identifier of the message
         */
        public init(chatId: Int64, messageId: Int64) {
            self.chatId = chatId
            self.messageId = messageId
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            messageId = try container.decodeInt64(forKey: .init(string: "messageId"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encodeInt64(messageId, forKey: .init(string: "messageId"))
        }
    }
}
