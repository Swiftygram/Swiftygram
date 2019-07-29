//
//  GetChatEventLog.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns a list of service actions taken by chat members and administrators in the last 48 hours. Available only in supergroups and channels. Requires administrator rights. Returns results in reverse chronological order (i. e., in order of decreasing event_id)

     - ReturnType: `TDObject.ChatEvents`
     */
    struct GetChatEventLog: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.ChatEvents

        /**
         Chat identifier
         */
        public var chatId: Int64

        /**
         Search query by which to filter events
         */
        public var query: String

        /**
         Identifier of an event from which to return results. Use 0 to get results from the latest events
         */
        public var fromEventId: Int64

        /**
         Maximum number of events to return; up to 100
         */
        public var limit: Int

        /**
         The types of events to return. By default, all types will be returned
         */
        public var filters: TDObject.ChatEventLogFilters

        /**
         User identifiers by which to filter events. By default, events relating to all users will be returned
         */
        public var userIds: [Int]

        /**
         Returns a list of service actions taken by chat members and administrators in the last 48 hours. Available only in supergroups and channels. Requires administrator rights. Returns results in reverse chronological order (i. e., in order of decreasing event_id)

         - Parameter chatId: Chat identifier
         - Parameter query: Search query by which to filter events
         - Parameter fromEventId: Identifier of an event from which to return results. Use 0 to get results from the latest events
         - Parameter limit: Maximum number of events to return; up to 100
         - Parameter filters: The types of events to return. By default, all types will be returned
         - Parameter userIds: User identifiers by which to filter events. By default, events relating to all users will be returned
         */
        public init(chatId: Int64, query: String, fromEventId: Int64, limit: Int, filters: TDObject.ChatEventLogFilters, userIds: [Int]) {
            self.chatId = chatId
            self.query = query
            self.fromEventId = fromEventId
            self.limit = limit
            self.filters = filters
            self.userIds = userIds
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            query = try container.decode(String.self, forKey: .init(string: "query"))
            fromEventId = try container.decodeInt64(forKey: .init(string: "fromEventId"))
            limit = try container.decode(Int.self, forKey: .init(string: "limit"))
            filters = try container.decode(TDObject.ChatEventLogFilters.self, forKey: .init(string: "filters"))
            userIds = try container.decode([Int].self, forKey: .init(string: "userIds"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encode(query, forKey: .init(string: "query"))
            try container.encodeInt64(fromEventId, forKey: .init(string: "fromEventId"))
            try container.encode(limit, forKey: .init(string: "limit"))
            try container.encode(filters, forKey: .init(string: "filters"))
            try container.encode(userIds, forKey: .init(string: "userIds"))
        }
    }
}
