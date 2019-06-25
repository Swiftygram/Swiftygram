//
//  ChatNotificationSettings.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains information about notification settings for a chat
     */
    struct ChatNotificationSettings: TDObjectProtocol {
        /**
         If true, mute_for is ignored and the value for the relevant type of chat is used instead
         */
        public let useDefaultMuteFor: Bool

        /**
         Time left before notifications will be unmuted, in seconds
         */
        public let muteFor: Int

        /**
         If true, sound is ignored and the value for the relevant type of chat is used instead
         */
        public let useDefaultSound: Bool

        /**
         The name of an audio file to be used for notification sounds; only applies to iOS applications
         */
        public let sound: String

        /**
         If true, show_preview is ignored and the value for the relevant type of chat is used instead
         */
        public let useDefaultShowPreview: Bool

        /**
         True, if message content should be displayed in notifications
         */
        public let showPreview: Bool

        /**
         If true, disable_pinned_message_notifications is ignored and the value for the relevant type of chat is used instead
         */
        public let useDefaultDisablePinnedMessageNotifications: Bool

        /**
         If true, notifications for incoming pinned messages will be created as for an ordinary unread message
         */
        public let disablePinnedMessageNotifications: Bool

        /**
         If true, disable_mention_notifications is ignored and the value for the relevant type of chat is used instead
         */
        public let useDefaultDisableMentionNotifications: Bool

        /**
         If true, notifications for messages with mentions will be created as for an ordinary unread message
         */
        public let disableMentionNotifications: Bool

        /**
         Contains information about notification settings for a chat

         - Parameter useDefaultMuteFor: If true, mute_for is ignored and the value for the relevant type of chat is used instead
         - Parameter muteFor: Time left before notifications will be unmuted, in seconds
         - Parameter useDefaultSound: If true, sound is ignored and the value for the relevant type of chat is used instead
         - Parameter sound: The name of an audio file to be used for notification sounds; only applies to iOS applications
         - Parameter useDefaultShowPreview: If true, show_preview is ignored and the value for the relevant type of chat is used instead
         - Parameter showPreview: True, if message content should be displayed in notifications
         - Parameter useDefaultDisablePinnedMessageNotifications: If true, disable_pinned_message_notifications is ignored and the value for the relevant type of chat is used instead
         - Parameter disablePinnedMessageNotifications: If true, notifications for incoming pinned messages will be created as for an ordinary unread message
         - Parameter useDefaultDisableMentionNotifications: If true, disable_mention_notifications is ignored and the value for the relevant type of chat is used instead
         - Parameter disableMentionNotifications: If true, notifications for messages with mentions will be created as for an ordinary unread message
         */
        public init(useDefaultMuteFor: Bool, muteFor: Int, useDefaultSound: Bool, sound: String, useDefaultShowPreview: Bool, showPreview: Bool, useDefaultDisablePinnedMessageNotifications: Bool, disablePinnedMessageNotifications: Bool, useDefaultDisableMentionNotifications: Bool, disableMentionNotifications: Bool) {
            self.useDefaultMuteFor = useDefaultMuteFor
            self.muteFor = muteFor
            self.useDefaultSound = useDefaultSound
            self.sound = sound
            self.useDefaultShowPreview = useDefaultShowPreview
            self.showPreview = showPreview
            self.useDefaultDisablePinnedMessageNotifications = useDefaultDisablePinnedMessageNotifications
            self.disablePinnedMessageNotifications = disablePinnedMessageNotifications
            self.useDefaultDisableMentionNotifications = useDefaultDisableMentionNotifications
            self.disableMentionNotifications = disableMentionNotifications
        }
    }
}
