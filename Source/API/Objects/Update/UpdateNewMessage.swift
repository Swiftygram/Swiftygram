//
//  UpdateNewMessage.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     A new message was received; can also be an outgoing message
     */
    struct UpdateNewMessage: TDObject.Update {
        /**
         The new message
         */
        public let message: TDObject.Message

        /**
         A new message was received; can also be an outgoing message

         - Parameter message: The new message
         */
        public init(message: TDObject.Message) {
            self.message = message
        }
    }
}
