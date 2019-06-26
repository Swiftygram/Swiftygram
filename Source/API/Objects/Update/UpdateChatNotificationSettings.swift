//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Notification settings for a chat were changed
     */
    struct UpdateChatNotificationSettings: TDObject.Update {
        /**
         Chat identifier
         */
        public var chatId: Int64

        /**
         The new notification settings
         */
        public var notificationSettings: TDObject.ChatNotificationSettings

        /**
         Notification settings for a chat were changed

         - Parameter chatId: Chat identifier
         - Parameter notificationSettings: The new notification settings
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
