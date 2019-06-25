//
//  RegisterDevice.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Registers the currently used device for receiving push notifications. Returns a globally unique identifier of the push notification subscription

     - ReturnType: `TDObject.PushReceiverId`
     */
    struct RegisterDevice: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.PushReceiverId

        /**
         Device token
         */
        public let deviceToken: TDEnum.DeviceToken

        /**
         List of user identifiers of other users currently using the client
         */
        public let otherUserIds: [Int]

        /**
         Registers the currently used device for receiving push notifications. Returns a globally unique identifier of the push notification subscription

         - Parameter deviceToken: Device token
         - Parameter otherUserIds: List of user identifiers of other users currently using the client
         */
        public init(deviceToken: TDEnum.DeviceToken, otherUserIds: [Int]) {
            self.deviceToken = deviceToken
            self.otherUserIds = otherUserIds
        }
    }
}
