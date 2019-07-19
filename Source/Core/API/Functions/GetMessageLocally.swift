//
//  GetMessageLocally.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns information about a message, if it is available locally without sending network request. This is an offline request

     - ReturnType: `TDObject.Message`
     */
    struct GetMessageLocally: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Message

        /**
         Identifier of the chat the message belongs to
         */
        public var chatId: Int64

        /**
         Identifier of the message to get
         */
        public var messageId: Int64

        /**
         Returns information about a message, if it is available locally without sending network request. This is an offline request

         - Parameter chatId: Identifier of the chat the message belongs to
         - Parameter messageId: Identifier of the message to get
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
