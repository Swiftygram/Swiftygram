//
//  UpdateChatDefaultDisableNotification.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     The value of the default disable_notification parameter, used when a message is sent to the chat, was changed
     */
    struct UpdateChatDefaultDisableNotification: TDObject.Update {
        /**
         Chat identifier
         */
        public let chatId: Int64

        /**
         The new default_disable_notification value
         */
        public let defaultDisableNotification: Bool

        /**
         The value of the default disable_notification parameter, used when a message is sent to the chat, was changed

         - Parameter chatId: Chat identifier
         - Parameter defaultDisableNotification: The new default_disable_notification value
         */
        public init(chatId: Int64, defaultDisableNotification: Bool) {
            self.chatId = chatId
            self.defaultDisableNotification = defaultDisableNotification
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            defaultDisableNotification = try container.decode(Bool.self, forKey: .init(string: "defaultDisableNotification"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encode(defaultDisableNotification, forKey: .init(string: "defaultDisableNotification"))
        }
    }
}
