//
//  UpdateNewChat.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     A new chat has been loaded/created. This update is guaranteed to come before the chat identifier is returned to the client. The chat field changes will be reported through separate updates
     */
    struct UpdateNewChat: TDObject.Update {
        /**
         The chat
         */
        public var chat: TDObject.Chat

        /**
         A new chat has been loaded/created. This update is guaranteed to come before the chat identifier is returned to the client. The chat field changes will be reported through separate updates

         - Parameter chat: The chat
         */
        public init(chat: TDObject.Chat) {
            self.chat = chat
        }
    }
}
