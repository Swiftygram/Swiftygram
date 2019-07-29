//
//  ViewMessages.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Informs TDLib that messages are being viewed by the user. Many useful activities depend on whether the messages are currently being viewed or not (e.g., marking messages as read, incrementing a view counter, updating a view counter, removing deleted messages in supergroups and channels)

     - ReturnType: `TDObject.Ok`
     */
    struct ViewMessages: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Chat identifier
         */
        public var chatId: Int64

        /**
         The identifiers of the messages being viewed
         */
        public var messageIds: [Int64]

        /**
         True, if messages in closed chats should be marked as read
         */
        public var forceRead: Bool

        /**
         Informs TDLib that messages are being viewed by the user. Many useful activities depend on whether the messages are currently being viewed or not (e.g., marking messages as read, incrementing a view counter, updating a view counter, removing deleted messages in supergroups and channels)

         - Parameter chatId: Chat identifier
         - Parameter messageIds: The identifiers of the messages being viewed
         - Parameter forceRead: True, if messages in closed chats should be marked as read
         */
        public init(chatId: Int64, messageIds: [Int64], forceRead: Bool) {
            self.chatId = chatId
            self.messageIds = messageIds
            self.forceRead = forceRead
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            messageIds = try container.decodeInt64Array(forKey: .init(string: "messageIds"))
            forceRead = try container.decode(Bool.self, forKey: .init(string: "forceRead"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encodeInt64Array(messageIds, forKey: .init(string: "messageIds"))
            try container.encode(forceRead, forKey: .init(string: "forceRead"))
        }
    }
}
