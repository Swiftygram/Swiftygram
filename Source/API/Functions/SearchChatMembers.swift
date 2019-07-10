//
//  SearchChatMembers.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Searches for a specified query in the first name, last name and username of the members of a specified chat. Requires administrator rights in channels

     - ReturnType: `TDObject.ChatMembers`
     */
    struct SearchChatMembers: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.ChatMembers

        /**
         Chat identifier
         */
        public var chatId: Int64

        /**
         Query to search for
         */
        public var query: String

        /**
         The maximum number of users to be returned
         */
        public var limit: Int

        /**
         The type of users to return. By default, chatMembersFilterMembers
         */
        public var filter: TDEnum.ChatMembersFilter

        /**
         Searches for a specified query in the first name, last name and username of the members of a specified chat. Requires administrator rights in channels

         - Parameter chatId: Chat identifier
         - Parameter query: Query to search for
         - Parameter limit: The maximum number of users to be returned
         - Parameter filter: The type of users to return. By default, chatMembersFilterMembers
         */
        public init(chatId: Int64, query: String, limit: Int, filter: TDEnum.ChatMembersFilter) {
            self.chatId = chatId
            self.query = query
            self.limit = limit
            self.filter = filter
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            query = try container.decode(String.self, forKey: .init(string: "query"))
            limit = try container.decode(Int.self, forKey: .init(string: "limit"))
            filter = try container.decode(TDEnum.ChatMembersFilter.self, forKey: .init(string: "filter"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encode(query, forKey: .init(string: "query"))
            try container.encode(limit, forKey: .init(string: "limit"))
            try container.encode(filter, forKey: .init(string: "filter"))
        }
    }
}
