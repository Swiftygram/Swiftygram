//
//  GetChatMember.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns information about a single member of a chat

     - ReturnType: `TDObject.ChatMember`
     */
    struct GetChatMember: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.ChatMember

        /**
         Chat identifier
         */
        public var chatId: Int64

        /**
         User identifier
         */
        public var userId: Int

        /**
         Returns information about a single member of a chat

         - Parameter chatId: Chat identifier
         - Parameter userId: User identifier
         */
        public init(chatId: Int64, userId: Int) {
            self.chatId = chatId
            self.userId = userId
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            userId = try container.decode(Int.self, forKey: .init(string: "userId"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encode(userId, forKey: .init(string: "userId"))
        }
    }
}
