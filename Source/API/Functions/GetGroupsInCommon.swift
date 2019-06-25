//
//  GetGroupsInCommon.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns a list of common group chats with a given user. Chats are sorted by their type and creation date

     - ReturnType: `TDObject.Chats`
     */
    struct GetGroupsInCommon: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Chats

        /**
         User identifier
         */
        public let userId: Int

        /**
         Chat identifier starting from which to return chats; use 0 for the first request
         */
        public let offsetChatId: Int64

        /**
         Maximum number of chats to be returned; up to 100
         */
        public let limit: Int

        /**
         Returns a list of common group chats with a given user. Chats are sorted by their type and creation date

         - Parameter userId: User identifier
         - Parameter offsetChatId: Chat identifier starting from which to return chats; use 0 for the first request
         - Parameter limit: Maximum number of chats to be returned; up to 100
         */
        public init(userId: Int, offsetChatId: Int64, limit: Int) {
            self.userId = userId
            self.offsetChatId = offsetChatId
            self.limit = limit
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            userId = try container.decode(Int.self, forKey: .init(string: "userId"))
            offsetChatId = try container.decodeInt64(forKey: .init(string: "offsetChatId"))
            limit = try container.decode(Int.self, forKey: .init(string: "limit"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encode(userId, forKey: .init(string: "userId"))
            try container.encodeInt64(offsetChatId, forKey: .init(string: "offsetChatId"))
            try container.encode(limit, forKey: .init(string: "limit"))
        }
    }
}
