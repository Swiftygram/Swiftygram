//
//  NotificationGroup.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Describes a group of notifications
     */
    struct NotificationGroup: TDObjectProtocol {
        /**
         Unique persistent auto-incremented from 1 identifier of the notification group
         */
        public var id: Int

        /**
         Type of the group
         */
        public var type: TDEnum.NotificationGroupType

        /**
         Identifier of a chat to which all notifications in the group belong
         */
        public var chatId: Int64

        /**
         Total number of active notifications in the group
         */
        public var totalCount: Int

        /**
         The list of active notifications
         */
        public var notifications: [TDObject.Notification]

        /**
         Describes a group of notifications

         - Parameter id: Unique persistent auto-incremented from 1 identifier of the notification group
         - Parameter type: Type of the group
         - Parameter chatId: Identifier of a chat to which all notifications in the group belong
         - Parameter totalCount: Total number of active notifications in the group
         - Parameter notifications: The list of active notifications
         */
        public init(id: Int, type: TDEnum.NotificationGroupType, chatId: Int64, totalCount: Int, notifications: [TDObject.Notification]) {
            self.id = id
            self.type = type
            self.chatId = chatId
            self.totalCount = totalCount
            self.notifications = notifications
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            id = try container.decode(Int.self, forKey: .init(string: "id"))
            type = try container.decode(TDEnum.NotificationGroupType.self, forKey: .init(string: "type"))
            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            totalCount = try container.decode(Int.self, forKey: .init(string: "totalCount"))
            notifications = try container.decode([TDObject.Notification].self, forKey: .init(string: "notifications"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encode(id, forKey: .init(string: "id"))
            try container.encode(type, forKey: .init(string: "type"))
            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encode(totalCount, forKey: .init(string: "totalCount"))
            try container.encode(notifications, forKey: .init(string: "notifications"))
        }
    }
}
