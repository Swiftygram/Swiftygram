//
//  GetScopeNotificationSettings.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns the notification settings for chats of a given type

     - ReturnType: `TDObject.ScopeNotificationSettings`
     */
    struct GetScopeNotificationSettings: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.ScopeNotificationSettings

        /**
         Types of chats for which to return the notification settings information
         */
        public let scope: TDEnum.NotificationSettingsScope

        /**
         Returns the notification settings for chats of a given type

         - Parameter scope: Types of chats for which to return the notification settings information
         */
        public init(scope: TDEnum.NotificationSettingsScope) {
            self.scope = scope
        }
    }
}
