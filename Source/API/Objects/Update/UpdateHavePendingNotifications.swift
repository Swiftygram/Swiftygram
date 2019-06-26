//
//  UpdateHavePendingNotifications.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Describes, whether there are some pending notification updates. Can be used to prevent application from killing, while there are some pending notifications
     */
    struct UpdateHavePendingNotifications: TDObject.Update {
        /**
         True, if there are some delayed notification updates, which will be sent soon
         */
        public let haveDelayedNotifications: Bool

        /**
         True, if there can be some yet unreceived notifications, which are being fetched from the server
         */
        public let haveUnreceivedNotifications: Bool

        /**
         Describes, whether there are some pending notification updates. Can be used to prevent application from killing, while there are some pending notifications

         - Parameter haveDelayedNotifications: True, if there are some delayed notification updates, which will be sent soon
         - Parameter haveUnreceivedNotifications: True, if there can be some yet unreceived notifications, which are being fetched from the server
         */
        public init(haveDelayedNotifications: Bool, haveUnreceivedNotifications: Bool) {
            self.haveDelayedNotifications = haveDelayedNotifications
            self.haveUnreceivedNotifications = haveUnreceivedNotifications
        }
    }
}
