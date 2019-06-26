//
//  UpdateUserChatAction.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     User activity in the chat has changed
     */
    struct UpdateUserChatAction: TDObject.Update {
        /**
         Chat identifier
         */
        public let chatId: Int64

        /**
         Identifier of a user performing an action
         */
        public let userId: Int

        /**
         The action description
         */
        public let action: TDEnum.ChatAction

        /**
         User activity in the chat has changed

         - Parameter chatId: Chat identifier
         - Parameter userId: Identifier of a user performing an action
         - Parameter action: The action description
         */
        public init(chatId: Int64, userId: Int, action: TDEnum.ChatAction) {
            self.chatId = chatId
            self.userId = userId
            self.action = action
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            userId = try container.decode(Int.self, forKey: .init(string: "userId"))
            action = try container.decode(TDEnum.ChatAction.self, forKey: .init(string: "action"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encode(userId, forKey: .init(string: "userId"))
            try container.encode(action, forKey: .init(string: "action"))
        }
    }
}
