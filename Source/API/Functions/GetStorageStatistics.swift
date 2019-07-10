//
//  GetStorageStatistics.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns storage usage statistics. Can be called before authorization

     - ReturnType: `TDObject.StorageStatistics`
     */
    struct GetStorageStatistics: TDFunctionProtocol, AuthorizationIndependentFunction {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.StorageStatistics

        /**
         Maximum number of chats with the largest storage usage for which separate statistics should be returned. All other chats will be grouped in entries with chat_id == 0. If the chat info database is not used, the chat_limit is ignored and is always set to 0
         */
        public var chatLimit: Int

        /**
         Returns storage usage statistics. Can be called before authorization

         - Parameter chatLimit: Maximum number of chats with the largest storage usage for which separate statistics should be returned. All other chats will be grouped in entries with chat_id == 0. If the chat info database is not used, the chat_limit is ignored and is always set to 0
         */
        public init(chatLimit: Int) {
            self.chatLimit = chatLimit
        }
    }
}
