//
//  Messages.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains a list of messages
     */
    struct Messages: TDObjectProtocol {
        /**
         Approximate total count of messages found
         */
        public let totalCount: Int

        /**
         List of messages; messages may be null
         */
        public let messages: [TDObject.Message]

        /**
         Contains a list of messages

         - Parameter totalCount: Approximate total count of messages found
         - Parameter messages: List of messages; messages may be null
         */
        public init(totalCount: Int, messages: [TDObject.Message]) {
            self.totalCount = totalCount
            self.messages = messages
        }
    }
}
