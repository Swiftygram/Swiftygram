//
//  UpdateNotificationGroup.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     A list of active notifications in a notification group has changed
     */
    struct UpdateNotificationGroup: TDObject.Update {
        /**
         Unique notification group identifier
         */
        public var notificationGroupId: Int

        /**
         New type of the notification group
         */
        public var type: TDEnum.NotificationGroupType

        /**
         Identifier of a chat to which all notifications in the group belong
         */
        public var chatId: Int64

        /**
         Chat identifier, which notification settings must be applied to the added notifications
         */
        public var notificationSettingsChatId: Int64

        /**
         True, if the notifications should be shown without sound
         */
        public var isSilent: Bool

        /**
         Total number of unread notifications in the group, can be bigger than number of active notifications
         */
        public var totalCount: Int

        /**
         List of added group notifications, sorted by notification ID
         */
        public var addedNotifications: [TDObject.Notification]

        /**
         Identifiers of removed group notifications, sorted by notification ID
         */
        public var removedNotificationIds: [Int]

        /**
         A list of active notifications in a notification group has changed

         - Parameter notificationGroupId: Unique notification group identifier
         - Parameter type: New type of the notification group
         - Parameter chatId: Identifier of a chat to which all notifications in the group belong
         - Parameter notificationSettingsChatId: Chat identifier, which notification settings must be applied to the added notifications
         - Parameter isSilent: True, if the notifications should be shown without sound
         - Parameter totalCount: Total number of unread notifications in the group, can be bigger than number of active notifications
         - Parameter addedNotifications: List of added group notifications, sorted by notification ID
         - Parameter removedNotificationIds: Identifiers of removed group notifications, sorted by notification ID
         */
        public init(notificationGroupId: Int, type: TDEnum.NotificationGroupType, chatId: Int64, notificationSettingsChatId: Int64, isSilent: Bool, totalCount: Int, addedNotifications: [TDObject.Notification], removedNotificationIds: [Int]) {
            self.notificationGroupId = notificationGroupId
            self.type = type
            self.chatId = chatId
            self.notificationSettingsChatId = notificationSettingsChatId
            self.isSilent = isSilent
            self.totalCount = totalCount
            self.addedNotifications = addedNotifications
            self.removedNotificationIds = removedNotificationIds
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            notificationGroupId = try container.decode(Int.self, forKey: .init(string: "notificationGroupId"))
            type = try container.decode(TDEnum.NotificationGroupType.self, forKey: .init(string: "type"))
            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            notificationSettingsChatId = try container.decodeInt64(forKey: .init(string: "notificationSettingsChatId"))
            isSilent = try container.decode(Bool.self, forKey: .init(string: "isSilent"))
            totalCount = try container.decode(Int.self, forKey: .init(string: "totalCount"))
            addedNotifications = try container.decode([TDObject.Notification].self, forKey: .init(string: "addedNotifications"))
            removedNotificationIds = try container.decode([Int].self, forKey: .init(string: "removedNotificationIds"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encode(notificationGroupId, forKey: .init(string: "notificationGroupId"))
            try container.encode(type, forKey: .init(string: "type"))
            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encodeInt64(notificationSettingsChatId, forKey: .init(string: "notificationSettingsChatId"))
            try container.encode(isSilent, forKey: .init(string: "isSilent"))
            try container.encode(totalCount, forKey: .init(string: "totalCount"))
            try container.encode(addedNotifications, forKey: .init(string: "addedNotifications"))
            try container.encode(removedNotificationIds, forKey: .init(string: "removedNotificationIds"))
        }
    }
}
