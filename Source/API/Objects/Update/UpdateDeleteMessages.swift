//
//  UpdateDeleteMessages.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Some messages were deleted
     */
    struct UpdateDeleteMessages: TDObject.Update {
        /**
         Chat identifier
         */
        public let chatId: Int64

        /**
         Identifiers of the deleted messages
         */
        public let messageIds: [Int64]

        /**
         True, if the messages are permanently deleted by a user (as opposed to just becoming inaccessible)
         */
        public let isPermanent: Bool

        /**
         True, if the messages are deleted only from the cache and can possibly be retrieved again in the future
         */
        public let fromCache: Bool

        /**
         Some messages were deleted

         - Parameter chatId: Chat identifier
         - Parameter messageIds: Identifiers of the deleted messages
         - Parameter isPermanent: True, if the messages are permanently deleted by a user (as opposed to just becoming inaccessible)
         - Parameter fromCache: True, if the messages are deleted only from the cache and can possibly be retrieved again in the future
         */
        public init(chatId: Int64, messageIds: [Int64], isPermanent: Bool, fromCache: Bool) {
            self.chatId = chatId
            self.messageIds = messageIds
            self.isPermanent = isPermanent
            self.fromCache = fromCache
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            messageIds = try container.decodeInt64Array(forKey: .init(string: "messageIds"))
            isPermanent = try container.decode(Bool.self, forKey: .init(string: "isPermanent"))
            fromCache = try container.decode(Bool.self, forKey: .init(string: "fromCache"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encodeInt64Array(messageIds, forKey: .init(string: "messageIds"))
            try container.encode(isPermanent, forKey: .init(string: "isPermanent"))
            try container.encode(fromCache, forKey: .init(string: "fromCache"))
        }
    }
}
