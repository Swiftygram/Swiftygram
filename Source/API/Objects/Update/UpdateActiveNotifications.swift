//
//  UpdateActiveNotifications.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains active notifications that was shown on previous application launches. This update is sent only if a message database is used. In that case it comes once before any updateNotification and updateNotificationGroup update
     */
    struct UpdateActiveNotifications: TDObject.Update {
        /**
         Lists of active notification groups
         */
        public var groups: [TDObject.NotificationGroup]

        /**
         Contains active notifications that was shown on previous application launches. This update is sent only if a message database is used. In that case it comes once before any updateNotification and updateNotificationGroup update

         - Parameter groups: Lists of active notification groups
         */
        public init(groups: [TDObject.NotificationGroup]) {
            self.groups = groups
        }
    }
}
