//
//  UpdateNotification.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     A notification was changed
     */
    struct UpdateNotification: TDObject.Update {
        /**
         Unique notification group identifier
         */
        public var notificationGroupId: Int

        /**
         Changed notification
         */
        public var notification: TDObject.Notification

        /**
         A notification was changed

         - Parameter notificationGroupId: Unique notification group identifier
         - Parameter notification: Changed notification
         */
        public init(notificationGroupId: Int, notification: TDObject.Notification) {
            self.notificationGroupId = notificationGroupId
            self.notification = notification
        }
    }
}
