//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Removes a group of active notifications. Needs to be called only if the notification group is removed by the current user

     - ReturnType: `TDObject.Ok`
     */
    struct RemoveNotificationGroup: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Notification group identifier
         */
        public var notificationGroupId: Int

        /**
         Maximum identifier of removed notifications
         */
        public var maxNotificationId: Int

        /**
         Removes a group of active notifications. Needs to be called only if the notification group is removed by the current user

         - Parameter notificationGroupId: Notification group identifier
         - Parameter maxNotificationId: Maximum identifier of removed notifications
         */
        public init(notificationGroupId: Int, maxNotificationId: Int) {
            self.notificationGroupId = notificationGroupId
            self.maxNotificationId = maxNotificationId
        }
    }
}
