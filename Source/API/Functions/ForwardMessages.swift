//
//  ForwardMessages.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Forwards previously sent messages. Returns the forwarded messages in the same order as the message identifiers passed in message_ids. If a message can't be forwarded, null will be returned instead of the message

     - ReturnType: `TDObject.Messages`
     */
    struct ForwardMessages: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Messages

        /**
         Identifier of the chat to which to forward messages
         */
        public let chatId: Int64

        /**
         Identifier of the chat from which to forward messages
         */
        public let fromChatId: Int64

        /**
         Identifiers of the messages to forward
         */
        public let messageIds: [Int64]

        /**
         Pass true to disable notification for the message, doesn't work if messages are forwarded to a secret chat
         */
        public let disableNotification: Bool

        /**
         Pass true if the message is sent from the background
         */
        public let fromBackground: Bool

        /**
         True, if the messages should be grouped into an album after forwarding. For this to work, no more than 10 messages may be forwarded, and all of them must be photo or video messages
         */
        public let asAlbum: Bool

        /**
         Forwards previously sent messages. Returns the forwarded messages in the same order as the message identifiers passed in message_ids. If a message can't be forwarded, null will be returned instead of the message

         - Parameter chatId: Identifier of the chat to which to forward messages
         - Parameter fromChatId: Identifier of the chat from which to forward messages
         - Parameter messageIds: Identifiers of the messages to forward
         - Parameter disableNotification: Pass true to disable notification for the message, doesn't work if messages are forwarded to a secret chat
         - Parameter fromBackground: Pass true if the message is sent from the background
         - Parameter asAlbum: True, if the messages should be grouped into an album after forwarding. For this to work, no more than 10 messages may be forwarded, and all of them must be photo or video messages
         */
        public init(chatId: Int64, fromChatId: Int64, messageIds: [Int64], disableNotification: Bool, fromBackground: Bool, asAlbum: Bool) {
            self.chatId = chatId
            self.fromChatId = fromChatId
            self.messageIds = messageIds
            self.disableNotification = disableNotification
            self.fromBackground = fromBackground
            self.asAlbum = asAlbum
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            fromChatId = try container.decodeInt64(forKey: .init(string: "fromChatId"))
            messageIds = try container.decodeInt64Array(forKey: .init(string: "messageIds"))
            disableNotification = try container.decode(Bool.self, forKey: .init(string: "disableNotification"))
            fromBackground = try container.decode(Bool.self, forKey: .init(string: "fromBackground"))
            asAlbum = try container.decode(Bool.self, forKey: .init(string: "asAlbum"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encodeInt64(fromChatId, forKey: .init(string: "fromChatId"))
            try container.encodeInt64Array(messageIds, forKey: .init(string: "messageIds"))
            try container.encode(disableNotification, forKey: .init(string: "disableNotification"))
            try container.encode(fromBackground, forKey: .init(string: "fromBackground"))
            try container.encode(asAlbum, forKey: .init(string: "asAlbum"))
        }
    }
}
