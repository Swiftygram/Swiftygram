//
//  GetCallbackQueryAnswer.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Sends a callback query to a bot and returns an answer. Returns an error with code 502 if the bot fails to answer the query before the query timeout expires

     - ReturnType: `TDObject.CallbackQueryAnswer`
     */
    struct GetCallbackQueryAnswer: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.CallbackQueryAnswer

        /**
         Identifier of the chat with the message
         */
        public let chatId: Int64

        /**
         Identifier of the message from which the query originated
         */
        public let messageId: Int64

        /**
         Query payload
         */
        public let payload: TDEnum.CallbackQueryPayload

        /**
         Sends a callback query to a bot and returns an answer. Returns an error with code 502 if the bot fails to answer the query before the query timeout expires

         - Parameter chatId: Identifier of the chat with the message
         - Parameter messageId: Identifier of the message from which the query originated
         - Parameter payload: Query payload
         */
        public init(chatId: Int64, messageId: Int64, payload: TDEnum.CallbackQueryPayload) {
            self.chatId = chatId
            self.messageId = messageId
            self.payload = payload
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            messageId = try container.decodeInt64(forKey: .init(string: "messageId"))
            payload = try container.decode(TDEnum.CallbackQueryPayload.self, forKey: .init(string: "payload"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encodeInt64(messageId, forKey: .init(string: "messageId"))
            try container.encode(payload, forKey: .init(string: "payload"))
        }
    }
}
