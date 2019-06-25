//
//  PinChatMessage.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Pins a message in a chat; requires appropriate administrator rights in the group or channel

     - ReturnType: `TDObject.Ok`
     */
    struct PinChatMessage: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Identifier of the chat
         */
        public let chatId: Int64

        /**
         Identifier of the new pinned message
         */
        public let messageId: Int64

        /**
         True, if there should be no notification about the pinned message
         */
        public let disableNotification: Bool

        /**
         Pins a message in a chat; requires appropriate administrator rights in the group or channel

         - Parameter chatId: Identifier of the chat
         - Parameter messageId: Identifier of the new pinned message
         - Parameter disableNotification: True, if there should be no notification about the pinned message
         */
        public init(chatId: Int64, messageId: Int64, disableNotification: Bool) {
            self.chatId = chatId
            self.messageId = messageId
            self.disableNotification = disableNotification
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            messageId = try container.decodeInt64(forKey: .init(string: "messageId"))
            disableNotification = try container.decode(Bool.self, forKey: .init(string: "disableNotification"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encodeInt64(messageId, forKey: .init(string: "messageId"))
            try container.encode(disableNotification, forKey: .init(string: "disableNotification"))
        }
    }
}
