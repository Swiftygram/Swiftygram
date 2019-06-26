//
//  UpdateChatOnlineMemberCount.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     The number of online group members has changed. This update with non-zero count is sent only for currently opened chats. There is no guarantee that it will be sent just after the count has changed
     */
    struct UpdateChatOnlineMemberCount: TDObject.Update {
        /**
         Identifier of the chat
         */
        public let chatId: Int64

        /**
         New number of online members in the chat, or 0 if unknown
         */
        public let onlineMemberCount: Int

        /**
         The number of online group members has changed. This update with non-zero count is sent only for currently opened chats. There is no guarantee that it will be sent just after the count has changed

         - Parameter chatId: Identifier of the chat
         - Parameter onlineMemberCount: New number of online members in the chat, or 0 if unknown
         */
        public init(chatId: Int64, onlineMemberCount: Int) {
            self.chatId = chatId
            self.onlineMemberCount = onlineMemberCount
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            onlineMemberCount = try container.decode(Int.self, forKey: .init(string: "onlineMemberCount"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encode(onlineMemberCount, forKey: .init(string: "onlineMemberCount"))
        }
    }
}
