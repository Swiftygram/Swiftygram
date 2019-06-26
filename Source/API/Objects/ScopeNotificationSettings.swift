//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains information about notification settings for several chats
     */
    struct ScopeNotificationSettings: TDObjectProtocol {
        /**
         Time left before notifications will be unmuted, in seconds
         */
        public var muteFor: Int

        /**
         The name of an audio file to be used for notification sounds; only applies to iOS applications
         */
        public var sound: String

        /**
         True, if message content should be displayed in notifications
         */
        public var showPreview: Bool

        /**
         True, if notifications for incoming pinned messages will be created as for an ordinary unread message
         */
        public var disablePinnedMessageNotifications: Bool

        /**
         True, if notifications for messages with mentions will be created as for an ordinary unread message
         */
        public var disableMentionNotifications: Bool

        /**
         Contains information about notification settings for several chats

         - Parameter muteFor: Time left before notifications will be unmuted, in seconds
         - Parameter sound: The name of an audio file to be used for notification sounds; only applies to iOS applications
         - Parameter showPreview: True, if message content should be displayed in notifications
         - Parameter disablePinnedMessageNotifications: True, if notifications for incoming pinned messages will be created as for an ordinary unread message
         - Parameter disableMentionNotifications: True, if notifications for messages with mentions will be created as for an ordinary unread message
         */
        public init(muteFor: Int, sound: String, showPreview: Bool, disablePinnedMessageNotifications: Bool, disableMentionNotifications: Bool) {
            self.muteFor = muteFor
            self.sound = sound
            self.showPreview = showPreview
            self.disablePinnedMessageNotifications = disablePinnedMessageNotifications
            self.disableMentionNotifications = disableMentionNotifications
        }
    }
}
