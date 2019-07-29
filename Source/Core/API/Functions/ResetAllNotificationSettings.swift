//
//  ResetAllNotificationSettings.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Resets all notification settings to their default values. By default, all chats are unmuted, the sound is set to "default" and message previews are shown

     - ReturnType: `TDObject.Ok`
     */
    struct ResetAllNotificationSettings: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Resets all notification settings to their default values. By default, all chats are unmuted, the sound is set to "default" and message previews are shown
         */
        public init() {}
    }
}
