//
//  CheckChatUsername.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Checks whether a username can be set for a chat

     - ReturnType: `TDEnum.CheckChatUsernameResult`
     */
    struct CheckChatUsername: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDEnum.CheckChatUsernameResult

        /**
         Chat identifier; should be identifier of a supergroup chat, or a channel chat, or a private chat with self, or zero if chat is being created
         */
        public var chatId: Int64

        /**
         Username to be checked
         */
        public var username: String

        /**
         Checks whether a username can be set for a chat

         - Parameter chatId: Chat identifier; should be identifier of a supergroup chat, or a channel chat, or a private chat with self, or zero if chat is being created
         - Parameter username: Username to be checked
         */
        public init(chatId: Int64, username: String) {
            self.chatId = chatId
            self.username = username
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            username = try container.decode(String.self, forKey: .init(string: "username"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encode(username, forKey: .init(string: "username"))
        }
    }
}
