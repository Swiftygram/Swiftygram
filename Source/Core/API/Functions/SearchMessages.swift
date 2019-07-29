//
//  SearchMessages.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Searches for messages in all chats except secret chats. Returns the results in reverse chronological order (i.e., in order of decreasing (date, chat_id, message_id)).-For optimal performance the number of returned messages is chosen by the library

     - ReturnType: `TDObject.Messages`
     */
    struct SearchMessages: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Messages

        /**
         Query to search for
         */
        public var query: String

        /**
         The date of the message starting from which the results should be fetched. Use 0 or any date in the future to get results from the last message
         */
        public var offsetDate: Foundation.Date

        /**
         The chat identifier of the last found message, or 0 for the first request
         */
        public var offsetChatId: Int64

        /**
         The message identifier of the last found message, or 0 for the first request
         */
        public var offsetMessageId: Int64

        /**
         The maximum number of messages to be returned, up to 100. Fewer messages may be returned than specified by the limit, even if the end of the message history has not been reached
         */
        public var limit: Int

        /**
         Searches for messages in all chats except secret chats. Returns the results in reverse chronological order (i.e., in order of decreasing (date, chat_id, message_id)).-For optimal performance the number of returned messages is chosen by the library

         - Parameter query: Query to search for
         - Parameter offsetDate: The date of the message starting from which the results should be fetched. Use 0 or any date in the future to get results from the last message
         - Parameter offsetChatId: The chat identifier of the last found message, or 0 for the first request
         - Parameter offsetMessageId: The message identifier of the last found message, or 0 for the first request
         - Parameter limit: The maximum number of messages to be returned, up to 100. Fewer messages may be returned than specified by the limit, even if the end of the message history has not been reached
         */
        public init(query: String, offsetDate: Foundation.Date, offsetChatId: Int64, offsetMessageId: Int64, limit: Int) {
            self.query = query
            self.offsetDate = offsetDate
            self.offsetChatId = offsetChatId
            self.offsetMessageId = offsetMessageId
            self.limit = limit
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            query = try container.decode(String.self, forKey: .init(string: "query"))
            offsetDate = try container.decodeDate(forKey: .init(string: "offsetDate"))
            offsetChatId = try container.decodeInt64(forKey: .init(string: "offsetChatId"))
            offsetMessageId = try container.decodeInt64(forKey: .init(string: "offsetMessageId"))
            limit = try container.decode(Int.self, forKey: .init(string: "limit"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encode(query, forKey: .init(string: "query"))
            try container.encodeDate(offsetDate, forKey: .init(string: "offsetDate"))
            try container.encodeInt64(offsetChatId, forKey: .init(string: "offsetChatId"))
            try container.encodeInt64(offsetMessageId, forKey: .init(string: "offsetMessageId"))
            try container.encode(limit, forKey: .init(string: "limit"))
        }
    }
}
