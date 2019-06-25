//
//  SetChatNotificationSettings.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Changes the notification settings of a chat

     - ReturnType: `TDObject.Ok`
     */
    struct SetChatNotificationSettings: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Chat identifier
         */
        public let chatId: Int64

        /**
         New notification settings for the chat
         */
        public let notificationSettings: TDObject.ChatNotificationSettings

        /**
         Changes the notification settings of a chat

         - Parameter chatId: Chat identifier
         - Parameter notificationSettings: New notification settings for the chat
         */
        public init(chatId: Int64, notificationSettings: TDObject.ChatNotificationSettings) {
            self.chatId = chatId
            self.notificationSettings = notificationSettings
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            notificationSettings = try container.decode(TDObject.ChatNotificationSettings.self, forKey: .init(string: "notificationSettings"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encode(notificationSettings, forKey: .init(string: "notificationSettings"))
        }
    }
}
