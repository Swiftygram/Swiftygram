//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Number of unread messages has changed. This update is sent only if a message database is used
     */
    struct UpdateUnreadMessageCount: TDObject.Update {
        /**
         Total number of unread messages
         */
        public var unreadCount: Int

        /**
         Total number of unread messages in unmuted chats
         */
        public var unreadUnmutedCount: Int

        /**
         Number of unread messages has changed. This update is sent only if a message database is used

         - Parameter unreadCount: Total number of unread messages
         - Parameter unreadUnmutedCount: Total number of unread messages in unmuted chats
         */
        public init(unreadCount: Int, unreadUnmutedCount: Int) {
            self.unreadCount = unreadCount
            self.unreadUnmutedCount = unreadUnmutedCount
        }
    }
}
