//
//  RemoveTopChat.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Removes a chat from the list of frequently used chats. Supported only if the chat info database is enabled

     - ReturnType: `TDObject.Ok`
     */
    struct RemoveTopChat: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Category of frequently used chats
         */
        public let category: TDEnum.TopChatCategory

        /**
         Chat identifier
         */
        public let chatId: Int64

        /**
         Removes a chat from the list of frequently used chats. Supported only if the chat info database is enabled

         - Parameter category: Category of frequently used chats
         - Parameter chatId: Chat identifier
         */
        public init(category: TDEnum.TopChatCategory, chatId: Int64) {
            self.category = category
            self.chatId = chatId
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            category = try container.decode(TDEnum.TopChatCategory.self, forKey: .init(string: "category"))
            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encode(category, forKey: .init(string: "category"))
            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
        }
    }
}
