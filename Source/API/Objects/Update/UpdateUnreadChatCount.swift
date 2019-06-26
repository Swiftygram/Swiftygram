//
//  UpdateUnreadChatCount.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Number of unread chats, i.e. with unread messages or marked as unread, has changed. This update is sent only if a message database is used
     */
    struct UpdateUnreadChatCount: TDObject.Update {
        /**
         Total number of unread chats
         */
        public let unreadCount: Int

        /**
         Total number of unread unmuted chats
         */
        public let unreadUnmutedCount: Int

        /**
         Total number of chats marked as unread
         */
        public let markedAsUnreadCount: Int

        /**
         Total number of unmuted chats marked as unread
         */
        public let markedAsUnreadUnmutedCount: Int

        /**
         Number of unread chats, i.e. with unread messages or marked as unread, has changed. This update is sent only if a message database is used

         - Parameter unreadCount: Total number of unread chats
         - Parameter unreadUnmutedCount: Total number of unread unmuted chats
         - Parameter markedAsUnreadCount: Total number of chats marked as unread
         - Parameter markedAsUnreadUnmutedCount: Total number of unmuted chats marked as unread
         */
        public init(unreadCount: Int, unreadUnmutedCount: Int, markedAsUnreadCount: Int, markedAsUnreadUnmutedCount: Int) {
            self.unreadCount = unreadCount
            self.unreadUnmutedCount = unreadUnmutedCount
            self.markedAsUnreadCount = markedAsUnreadCount
            self.markedAsUnreadUnmutedCount = markedAsUnreadUnmutedCount
        }
    }
}
