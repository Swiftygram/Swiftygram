//
//  GetChats.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns an ordered list of chats. Chats are sorted by the pair (order, chat_id) in decreasing order. (For example, to get a list of chats from the beginning, the offset_order should be equal to a biggest signed 64-bit number 9223372036854775807 == 2^63 - 1).-For optimal performance the number of returned chats is chosen by the library.

     - ReturnType: `TDObject.Chats`
     */
    struct GetChats: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Chats

        /**
         Chat order to return chats from
         */
        public let offsetOrder: Int64

        /**
         Chat identifier to return chats from
         */
        public let offsetChatId: Int64

        /**
         The maximum number of chats to be returned. It is possible that fewer chats than the limit are returned even if the end of the list is not reached
         */
        public let limit: Int

        /**
         Returns an ordered list of chats. Chats are sorted by the pair (order, chat_id) in decreasing order. (For example, to get a list of chats from the beginning, the offset_order should be equal to a biggest signed 64-bit number 9223372036854775807 == 2^63 - 1).-For optimal performance the number of returned chats is chosen by the library.

         - Parameter offsetOrder: Chat order to return chats from
         - Parameter offsetChatId: Chat identifier to return chats from
         - Parameter limit: The maximum number of chats to be returned. It is possible that fewer chats than the limit are returned even if the end of the list is not reached
         */
        public init(offsetOrder: Int64, offsetChatId: Int64, limit: Int) {
            self.offsetOrder = offsetOrder
            self.offsetChatId = offsetChatId
            self.limit = limit
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            offsetOrder = try container.decodeInt64(forKey: .init(string: "offsetOrder"))
            offsetChatId = try container.decodeInt64(forKey: .init(string: "offsetChatId"))
            limit = try container.decode(Int.self, forKey: .init(string: "limit"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(offsetOrder, forKey: .init(string: "offsetOrder"))
            try container.encodeInt64(offsetChatId, forKey: .init(string: "offsetChatId"))
            try container.encode(limit, forKey: .init(string: "limit"))
        }
    }
}
