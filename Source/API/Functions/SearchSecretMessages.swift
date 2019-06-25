//
//  SearchSecretMessages.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Searches for messages in secret chats. Returns the results in reverse chronological order. For optimal performance the number of returned messages is chosen by the library

     - ReturnType: `TDObject.FoundMessages`
     */
    struct SearchSecretMessages: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.FoundMessages

        /**
         Identifier of the chat in which to search. Specify 0 to search in all secret chats
         */
        public let chatId: Int64

        /**
         Query to search for. If empty, searchChatMessages should be used instead
         */
        public let query: String

        /**
         The identifier from the result of a previous request, use 0 to get results from the last message
         */
        public let fromSearchId: Int64

        /**
         Maximum number of messages to be returned; up to 100. Fewer messages may be returned than specified by the limit, even if the end of the message history has not been reached
         */
        public let limit: Int

        /**
         A filter for the content of messages in the search results
         */
        public let filter: TDEnum.SearchMessagesFilter

        /**
         Searches for messages in secret chats. Returns the results in reverse chronological order. For optimal performance the number of returned messages is chosen by the library

         - Parameter chatId: Identifier of the chat in which to search. Specify 0 to search in all secret chats
         - Parameter query: Query to search for. If empty, searchChatMessages should be used instead
         - Parameter fromSearchId: The identifier from the result of a previous request, use 0 to get results from the last message
         - Parameter limit: Maximum number of messages to be returned; up to 100. Fewer messages may be returned than specified by the limit, even if the end of the message history has not been reached
         - Parameter filter: A filter for the content of messages in the search results
         */
        public init(chatId: Int64, query: String, fromSearchId: Int64, limit: Int, filter: TDEnum.SearchMessagesFilter) {
            self.chatId = chatId
            self.query = query
            self.fromSearchId = fromSearchId
            self.limit = limit
            self.filter = filter
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            query = try container.decode(String.self, forKey: .init(string: "query"))
            fromSearchId = try container.decodeInt64(forKey: .init(string: "fromSearchId"))
            limit = try container.decode(Int.self, forKey: .init(string: "limit"))
            filter = try container.decode(TDEnum.SearchMessagesFilter.self, forKey: .init(string: "filter"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encode(query, forKey: .init(string: "query"))
            try container.encodeInt64(fromSearchId, forKey: .init(string: "fromSearchId"))
            try container.encode(limit, forKey: .init(string: "limit"))
            try container.encode(filter, forKey: .init(string: "filter"))
        }
    }
}
