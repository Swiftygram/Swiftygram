//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Searches for messages with given words in the chat. Returns the results in reverse chronological order, i.e. in order of decreasing message_id. Cannot be used in secret chats with a non-empty query-(searchSecretMessages should be used instead), or without an enabled message database. For optimal performance the number of returned messages is chosen by the library

     - ReturnType: `TDObject.Messages`
     */
    struct SearchChatMessages: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Messages

        /**
         Identifier of the chat in which to search messages
         */
        public var chatId: Int64

        /**
         Query to search for
         */
        public var query: String

        /**
         If not 0, only messages sent by the specified user will be returned. Not supported in secret chats
         */
        public var senderUserId: Int

        /**
         Identifier of the message starting from which history must be fetched; use 0 to get results from the last message
         */
        public var fromMessageId: Int64

        /**
         Specify 0 to get results from exactly the from_message_id or a negative offset to get the specified message and some newer messages
         */
        public var offset: Int

        /**
         The maximum number of messages to be returned; must be positive and can't be greater than 100. If the offset is negative, the limit must be greater than -offset. Fewer messages may be returned than specified by the limit, even if the end of the message history has not been reached
         */
        public var limit: Int

        /**
         Filter for message content in the search results
         */
        public var filter: TDEnum.SearchMessagesFilter

        /**
         Searches for messages with given words in the chat. Returns the results in reverse chronological order, i.e. in order of decreasing message_id. Cannot be used in secret chats with a non-empty query-(searchSecretMessages should be used instead), or without an enabled message database. For optimal performance the number of returned messages is chosen by the library

         - Parameter chatId: Identifier of the chat in which to search messages
         - Parameter query: Query to search for
         - Parameter senderUserId: If not 0, only messages sent by the specified user will be returned. Not supported in secret chats
         - Parameter fromMessageId: Identifier of the message starting from which history must be fetched; use 0 to get results from the last message
         - Parameter offset: Specify 0 to get results from exactly the from_message_id or a negative offset to get the specified message and some newer messages
         - Parameter limit: The maximum number of messages to be returned; must be positive and can't be greater than 100. If the offset is negative, the limit must be greater than -offset. Fewer messages may be returned than specified by the limit, even if the end of the message history has not been reached
         - Parameter filter: Filter for message content in the search results
         */
        public init(chatId: Int64, query: String, senderUserId: Int, fromMessageId: Int64, offset: Int, limit: Int, filter: TDEnum.SearchMessagesFilter) {
            self.chatId = chatId
            self.query = query
            self.senderUserId = senderUserId
            self.fromMessageId = fromMessageId
            self.offset = offset
            self.limit = limit
            self.filter = filter
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            query = try container.decode(String.self, forKey: .init(string: "query"))
            senderUserId = try container.decode(Int.self, forKey: .init(string: "senderUserId"))
            fromMessageId = try container.decodeInt64(forKey: .init(string: "fromMessageId"))
            offset = try container.decode(Int.self, forKey: .init(string: "offset"))
            limit = try container.decode(Int.self, forKey: .init(string: "limit"))
            filter = try container.decode(TDEnum.SearchMessagesFilter.self, forKey: .init(string: "filter"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encode(query, forKey: .init(string: "query"))
            try container.encode(senderUserId, forKey: .init(string: "senderUserId"))
            try container.encodeInt64(fromMessageId, forKey: .init(string: "fromMessageId"))
            try container.encode(offset, forKey: .init(string: "offset"))
            try container.encode(limit, forKey: .init(string: "limit"))
            try container.encode(filter, forKey: .init(string: "filter"))
        }
    }
}
