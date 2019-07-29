//
//  SearchChatRecentLocationMessages.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns information about the recent locations of chat members that were sent to the chat. Returns up to 1 location message per user

     - ReturnType: `TDObject.Messages`
     */
    struct SearchChatRecentLocationMessages: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Messages

        /**
         Chat identifier
         */
        public var chatId: Int64

        /**
         Maximum number of messages to be returned
         */
        public var limit: Int

        /**
         Returns information about the recent locations of chat members that were sent to the chat. Returns up to 1 location message per user

         - Parameter chatId: Chat identifier
         - Parameter limit: Maximum number of messages to be returned
         */
        public init(chatId: Int64, limit: Int) {
            self.chatId = chatId
            self.limit = limit
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            limit = try container.decode(Int.self, forKey: .init(string: "limit"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encode(limit, forKey: .init(string: "limit"))
        }
    }
}
