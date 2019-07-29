//
//  GetMessages.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns information about messages. If a message is not found, returns null on the corresponding position of the result

     - ReturnType: `TDObject.Messages`
     */
    struct GetMessages: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Messages

        /**
         Identifier of the chat the messages belong to
         */
        public var chatId: Int64

        /**
         Identifiers of the messages to get
         */
        public var messageIds: [Int64]

        /**
         Returns information about messages. If a message is not found, returns null on the corresponding position of the result

         - Parameter chatId: Identifier of the chat the messages belong to
         - Parameter messageIds: Identifiers of the messages to get
         */
        public init(chatId: Int64, messageIds: [Int64]) {
            self.chatId = chatId
            self.messageIds = messageIds
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            messageIds = try container.decodeInt64Array(forKey: .init(string: "messageIds"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encodeInt64Array(messageIds, forKey: .init(string: "messageIds"))
        }
    }
}
