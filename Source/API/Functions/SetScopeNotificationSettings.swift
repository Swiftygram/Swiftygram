//
//  SetScopeNotificationSettings.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Changes notification settings for chats of a given type

     - ReturnType: `TDObject.Ok`
     */
    struct SetScopeNotificationSettings: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Types of chats for which to change the notification settings
         */
        public let scope: TDEnum.NotificationSettingsScope

        /**
         The new notification settings for the given scope
         */
        public let notificationSettings: TDObject.ScopeNotificationSettings

        /**
         Changes notification settings for chats of a given type

         - Parameter scope: Types of chats for which to change the notification settings
         - Parameter notificationSettings: The new notification settings for the given scope
         */
        public init(scope: TDEnum.NotificationSettingsScope, notificationSettings: TDObject.ScopeNotificationSettings) {
            self.scope = scope
            self.notificationSettings = notificationSettings
        }
    }
}
