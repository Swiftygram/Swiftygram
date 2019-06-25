//
//  UpdateServiceNotification.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Service notification from the server. Upon receiving this the client must show a popup with the content of the notification
     */
    struct UpdateServiceNotification: TDObject.Update {
        /**
         Notification type. If type begins with "AUTH_KEY_DROP_", then two buttons "Cancel" and "Log out" should be shown under notification; if user presses the second, all local data should be destroyed using Destroy method
         */
        public let type: String

        /**
         Notification content
         */
        public let content: TDEnum.MessageContent

        /**
         Service notification from the server. Upon receiving this the client must show a popup with the content of the notification

         - Parameter type: Notification type. If type begins with "AUTH_KEY_DROP_", then two buttons "Cancel" and "Log out" should be shown under notification; if user presses the second, all local data should be destroyed using Destroy method
         - Parameter content: Notification content
         */
        public init(type: String, content: TDEnum.MessageContent) {
            self.type = type
            self.content = content
        }
    }
}
