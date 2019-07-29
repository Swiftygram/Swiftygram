//
//  DeleteMessages.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Deletes messages

     - ReturnType: `TDObject.Ok`
     */
    struct DeleteMessages: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Chat identifier
         */
        public var chatId: Int64

        /**
         Identifiers of the messages to be deleted
         */
        public var messageIds: [Int64]

        /**
         Pass true to try to delete messages for all chat members. Always true for supergroups, channels and secret chats
         */
        public var revoke: Bool

        /**
         Deletes messages

         - Parameter chatId: Chat identifier
         - Parameter messageIds: Identifiers of the messages to be deleted
         - Parameter revoke: Pass true to try to delete messages for all chat members. Always true for supergroups, channels and secret chats
         */
        public init(chatId: Int64, messageIds: [Int64], revoke: Bool) {
            self.chatId = chatId
            self.messageIds = messageIds
            self.revoke = revoke
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            messageIds = try container.decodeInt64Array(forKey: .init(string: "messageIds"))
            revoke = try container.decode(Bool.self, forKey: .init(string: "revoke"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encodeInt64Array(messageIds, forKey: .init(string: "messageIds"))
            try container.encode(revoke, forKey: .init(string: "revoke"))
        }
    }
}
