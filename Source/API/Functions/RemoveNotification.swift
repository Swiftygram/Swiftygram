//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Removes an active notification from notification list. Needs to be called only if the notification is removed by the current user

     - ReturnType: `TDObject.Ok`
     */
    struct RemoveNotification: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Identifier of notification group to which the notification belongs
         */
        public var notificationGroupId: Int

        /**
         Identifier of removed notification
         */
        public var notificationId: Int

        /**
         Removes an active notification from notification list. Needs to be called only if the notification is removed by the current user

         - Parameter notificationGroupId: Identifier of notification group to which the notification belongs
         - Parameter notificationId: Identifier of removed notification
         */
        public init(notificationGroupId: Int, notificationId: Int) {
            self.notificationGroupId = notificationGroupId
            self.notificationId = notificationId
        }
    }
}
