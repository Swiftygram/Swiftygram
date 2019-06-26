//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Notification settings for some type of chats were updated
     */
    struct UpdateScopeNotificationSettings: TDObject.Update {
        /**
         Types of chats for which notification settings were updated
         */
        public var scope: TDEnum.NotificationSettingsScope

        /**
         The new notification settings
         */
        public var notificationSettings: TDObject.ScopeNotificationSettings

        /**
         Notification settings for some type of chats were updated

         - Parameter scope: Types of chats for which notification settings were updated
         - Parameter notificationSettings: The new notification settings
         */
        public init(scope: TDEnum.NotificationSettingsScope, notificationSettings: TDObject.ScopeNotificationSettings) {
            self.scope = scope
            self.notificationSettings = notificationSettings
        }
    }
}
