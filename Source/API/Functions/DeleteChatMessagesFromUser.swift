//
//  DeleteChatMessagesFromUser.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Deletes all messages sent by the specified user to a chat. Supported only in supergroups; requires can_delete_messages administrator privileges

     - ReturnType: `TDObject.Ok`
     */
    struct DeleteChatMessagesFromUser: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Chat identifier
         */
        public let chatId: Int64

        /**
         User identifier
         */
        public let userId: Int

        /**
         Deletes all messages sent by the specified user to a chat. Supported only in supergroups; requires can_delete_messages administrator privileges

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
