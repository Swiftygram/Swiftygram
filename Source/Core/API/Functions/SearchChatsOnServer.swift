//
//  SearchChatsOnServer.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Searches for the specified query in the title and username of already known chats via request to the server. Returns chats in the order seen in the chat list

     - ReturnType: `TDObject.Chats`
     */
    struct SearchChatsOnServer: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Chats

        /**
         Query to search for
         */
        public var query: String

        /**
         Maximum number of chats to be returned
         */
        public var limit: Int

        /**
         Searches for the specified query in the title and username of already known chats via request to the server. Returns chats in the order seen in the chat list

         - Parameter query: Query to search for
         - Parameter limit: Maximum number of chats to be returned
         */
        public init(query: String, limit: Int) {
            self.query = query
            self.limit = limit
        }
    }
}
