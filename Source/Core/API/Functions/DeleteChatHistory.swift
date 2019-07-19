//
//  DeleteChatHistory.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Deletes all messages in the chat. Use Chat.can_be_deleted_only_for_self and Chat.can_be_deleted_for_all_users fields to find whether and how the method can be applied to the chat

     - ReturnType: `TDObject.Ok`
     */
    struct DeleteChatHistory: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Chat identifier
         */
        public var chatId: Int64

        /**
         Pass true if the chat should be removed from the chat list
         */
        public var removeFromChatList: Bool

        /**
         Pass true to try to delete chat history for all users
         */
        public var revoke: Bool

        /**
         Deletes all messages in the chat. Use Chat.can_be_deleted_only_for_self and Chat.can_be_deleted_for_all_users fields to find whether and how the method can be applied to the chat

         - Parameter chatId: Chat identifier
         - Parameter removeFromChatList: Pass true if the chat should be removed from the chat list
         - Parameter revoke: Pass true to try to delete chat history for all users
         */
        public init(chatId: Int64, removeFromChatList: Bool, revoke: Bool) {
            self.chatId = chatId
            self.removeFromChatList = removeFromChatList
            self.revoke = revoke
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            removeFromChatList = try container.decode(Bool.self, forKey: .init(string: "removeFromChatList"))
            revoke = try container.decode(Bool.self, forKey: .init(string: "revoke"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encode(removeFromChatList, forKey: .init(string: "removeFromChatList"))
            try container.encode(revoke, forKey: .init(string: "revoke"))
        }
    }
}
