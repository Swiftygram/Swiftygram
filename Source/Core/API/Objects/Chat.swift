//
//  Chat.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     A chat. (Can be a private chat, basic group, supergroup, or secret chat)
     */
    struct Chat: TDObjectProtocol {
        /**
         Chat unique identifier
         */
        public var id: Int64

        /**
         Type of the chat
         */
        public var type: TDEnum.ChatType

        /**
         Chat title
         */
        public var title: String

        /**
         Chat photo; may be null
         */
        public var photo: TDObject.ChatPhoto?

        /**
         Last message in the chat; may be null
         */
        public var lastMessage: TDObject.Message?

        /**
         Descending parameter by which chats are sorted in the main chat list. If the order number of two chats is the same, they must be sorted in descending order by ID. If 0, the position of the chat in the list is undetermined
         */
        public var order: Int64

        /**
         True, if the chat is pinned
         */
        public var isPinned: Bool

        /**
         True, if the chat is marked as unread
         */
        public var isMarkedAsUnread: Bool

        /**
         True, if the chat is sponsored by the user's MTProxy server
         */
        public var isSponsored: Bool

        /**
         True, if the chat messages can be deleted only for the current user while other users will continue to see the messages
         */
        public var canBeDeletedOnlyForSelf: Bool

        /**
         True, if the chat messages can be deleted for all users
         */
        public var canBeDeletedForAllUsers: Bool

        /**
         True, if the chat can be reported to Telegram moderators through reportChat
         */
        public var canBeReported: Bool

        /**
         Default value of the disable_notification parameter, used when a message is sent to the chat
         */
        public var defaultDisableNotification: Bool

        /**
         Number of unread messages in the chat
         */
        public var unreadCount: Int

        /**
         Identifier of the last read incoming message
         */
        public var lastReadInboxMessageId: Int64

        /**
         Identifier of the last read outgoing message
         */
        public var lastReadOutboxMessageId: Int64

        /**
         Number of unread messages with a mention/reply in the chat
         */
        public var unreadMentionCount: Int

        /**
         Notification settings for this chat
         */
        public var notificationSettings: TDObject.ChatNotificationSettings

        /**
         Identifier of the pinned message in the chat; 0 if none
         */
        public var pinnedMessageId: Int64

        /**
         Identifier of the message from which reply markup needs to be used; 0 if there is no default custom reply markup in the chat
         */
        public var replyMarkupMessageId: Int64

        /**
         A draft of a message in the chat; may be null
         */
        public var draftMessage: TDObject.DraftMessage?

        /**
         Contains client-specific data associated with the chat. (For example, the chat position or local chat notification settings can be stored here.) Persistent if a message database is used
         */
        public var clientData: String

        /**
         A chat. (Can be a private chat, basic group, supergroup, or secret chat)

         - Parameter id: Chat unique identifier
         - Parameter type: Type of the chat
         - Parameter title: Chat title
         - Parameter photo: Chat photo; may be null
         - Parameter lastMessage: Last message in the chat; may be null
         - Parameter order: Descending parameter by which chats are sorted in the main chat list. If the order number of two chats is the same, they must be sorted in descending order by ID. If 0, the position of the chat in the list is undetermined
         - Parameter isPinned: True, if the chat is pinned
         - Parameter isMarkedAsUnread: True, if the chat is marked as unread
         - Parameter isSponsored: True, if the chat is sponsored by the user's MTProxy server
         - Parameter canBeDeletedOnlyForSelf: True, if the chat messages can be deleted only for the current user while other users will continue to see the messages
         - Parameter canBeDeletedForAllUsers: True, if the chat messages can be deleted for all users
         - Parameter canBeReported: True, if the chat can be reported to Telegram moderators through reportChat
         - Parameter defaultDisableNotification: Default value of the disable_notification parameter, used when a message is sent to the chat
         - Parameter unreadCount: Number of unread messages in the chat
         - Parameter lastReadInboxMessageId: Identifier of the last read incoming message
         - Parameter lastReadOutboxMessageId: Identifier of the last read outgoing message
         - Parameter unreadMentionCount: Number of unread messages with a mention/reply in the chat
         - Parameter notificationSettings: Notification settings for this chat
         - Parameter pinnedMessageId: Identifier of the pinned message in the chat; 0 if none
         - Parameter replyMarkupMessageId: Identifier of the message from which reply markup needs to be used; 0 if there is no default custom reply markup in the chat
         - Parameter draftMessage: A draft of a message in the chat; may be null
         - Parameter clientData: Contains client-specific data associated with the chat. (For example, the chat position or local chat notification settings can be stored here.) Persistent if a message database is used
         */
        public init(id: Int64, type: TDEnum.ChatType, title: String, photo: TDObject.ChatPhoto?, lastMessage: TDObject.Message?, order: Int64, isPinned: Bool, isMarkedAsUnread: Bool, isSponsored: Bool, canBeDeletedOnlyForSelf: Bool, canBeDeletedForAllUsers: Bool, canBeReported: Bool, defaultDisableNotification: Bool, unreadCount: Int, lastReadInboxMessageId: Int64, lastReadOutboxMessageId: Int64, unreadMentionCount: Int, notificationSettings: TDObject.ChatNotificationSettings, pinnedMessageId: Int64, replyMarkupMessageId: Int64, draftMessage: TDObject.DraftMessage?, clientData: String) {
            self.id = id
            self.type = type
            self.title = title
            self.photo = photo
            self.lastMessage = lastMessage
            self.order = order
            self.isPinned = isPinned
            self.isMarkedAsUnread = isMarkedAsUnread
            self.isSponsored = isSponsored
            self.canBeDeletedOnlyForSelf = canBeDeletedOnlyForSelf
            self.canBeDeletedForAllUsers = canBeDeletedForAllUsers
            self.canBeReported = canBeReported
            self.defaultDisableNotification = defaultDisableNotification
            self.unreadCount = unreadCount
            self.lastReadInboxMessageId = lastReadInboxMessageId
            self.lastReadOutboxMessageId = lastReadOutboxMessageId
            self.unreadMentionCount = unreadMentionCount
            self.notificationSettings = notificationSettings
            self.pinnedMessageId = pinnedMessageId
            self.replyMarkupMessageId = replyMarkupMessageId
            self.draftMessage = draftMessage
            self.clientData = clientData
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            id = try container.decodeInt64(forKey: .init(string: "id"))
            type = try container.decode(TDEnum.ChatType.self, forKey: .init(string: "type"))
            title = try container.decode(String.self, forKey: .init(string: "title"))
            photo = try container.decodeIfPresent(TDObject.ChatPhoto.self, forKey: .init(string: "photo"))
            lastMessage = try container.decodeIfPresent(TDObject.Message.self, forKey: .init(string: "lastMessage"))
            order = try container.decodeInt64(forKey: .init(string: "order"))
            isPinned = try container.decode(Bool.self, forKey: .init(string: "isPinned"))
            isMarkedAsUnread = try container.decode(Bool.self, forKey: .init(string: "isMarkedAsUnread"))
            isSponsored = try container.decode(Bool.self, forKey: .init(string: "isSponsored"))
            canBeDeletedOnlyForSelf = try container.decode(Bool.self, forKey: .init(string: "canBeDeletedOnlyForSelf"))
            canBeDeletedForAllUsers = try container.decode(Bool.self, forKey: .init(string: "canBeDeletedForAllUsers"))
            canBeReported = try container.decode(Bool.self, forKey: .init(string: "canBeReported"))
            defaultDisableNotification = try container.decode(Bool.self, forKey: .init(string: "defaultDisableNotification"))
            unreadCount = try container.decode(Int.self, forKey: .init(string: "unreadCount"))
            lastReadInboxMessageId = try container.decodeInt64(forKey: .init(string: "lastReadInboxMessageId"))
            lastReadOutboxMessageId = try container.decodeInt64(forKey: .init(string: "lastReadOutboxMessageId"))
            unreadMentionCount = try container.decode(Int.self, forKey: .init(string: "unreadMentionCount"))
            notificationSettings = try container.decode(TDObject.ChatNotificationSettings.self, forKey: .init(string: "notificationSettings"))
            pinnedMessageId = try container.decodeInt64(forKey: .init(string: "pinnedMessageId"))
            replyMarkupMessageId = try container.decodeInt64(forKey: .init(string: "replyMarkupMessageId"))
            draftMessage = try container.decodeIfPresent(TDObject.DraftMessage.self, forKey: .init(string: "draftMessage"))
            clientData = try container.decode(String.self, forKey: .init(string: "clientData"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(id, forKey: .init(string: "id"))
            try container.encode(type, forKey: .init(string: "type"))
            try container.encode(title, forKey: .init(string: "title"))
            try container.encodeIfPresent(photo, forKey: .init(string: "photo"))
            try container.encodeIfPresent(lastMessage, forKey: .init(string: "lastMessage"))
            try container.encodeInt64(order, forKey: .init(string: "order"))
            try container.encode(isPinned, forKey: .init(string: "isPinned"))
            try container.encode(isMarkedAsUnread, forKey: .init(string: "isMarkedAsUnread"))
            try container.encode(isSponsored, forKey: .init(string: "isSponsored"))
            try container.encode(canBeDeletedOnlyForSelf, forKey: .init(string: "canBeDeletedOnlyForSelf"))
            try container.encode(canBeDeletedForAllUsers, forKey: .init(string: "canBeDeletedForAllUsers"))
            try container.encode(canBeReported, forKey: .init(string: "canBeReported"))
            try container.encode(defaultDisableNotification, forKey: .init(string: "defaultDisableNotification"))
            try container.encode(unreadCount, forKey: .init(string: "unreadCount"))
            try container.encodeInt64(lastReadInboxMessageId, forKey: .init(string: "lastReadInboxMessageId"))
            try container.encodeInt64(lastReadOutboxMessageId, forKey: .init(string: "lastReadOutboxMessageId"))
            try container.encode(unreadMentionCount, forKey: .init(string: "unreadMentionCount"))
            try container.encode(notificationSettings, forKey: .init(string: "notificationSettings"))
            try container.encodeInt64(pinnedMessageId, forKey: .init(string: "pinnedMessageId"))
            try container.encodeInt64(replyMarkupMessageId, forKey: .init(string: "replyMarkupMessageId"))
            try container.encodeIfPresent(draftMessage, forKey: .init(string: "draftMessage"))
            try container.encode(clientData, forKey: .init(string: "clientData"))
        }
    }
}
