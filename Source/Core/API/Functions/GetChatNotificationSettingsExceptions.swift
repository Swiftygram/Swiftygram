//
//  GetChatNotificationSettingsExceptions.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns list of chats with non-default notification settings

     - ReturnType: `TDObject.Chats`
     */
    struct GetChatNotificationSettingsExceptions: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Chats

        /**
         If specified, only chats from the specified scope will be returned
         */
        public var scope: TDEnum.NotificationSettingsScope

        /**
         If true, also chats with non-default sound will be returned
         */
        public var compareSound: Bool

        /**
         Returns list of chats with non-default notification settings

         - Parameter scope: If specified, only chats from the specified scope will be returned
         - Parameter compareSound: If true, also chats with non-default sound will be returned
         */
        public init(scope: TDEnum.NotificationSettingsScope, compareSound: Bool) {
            self.scope = scope
            self.compareSound = compareSound
        }
    }
}
