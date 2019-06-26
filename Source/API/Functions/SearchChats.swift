//
//  SearchChats.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Searches for the specified query in the title and username of already known chats, this is an offline request. Returns chats in the order seen in the chat list

     - ReturnType: `TDObject.Chats`
     */
    struct SearchChats: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Chats

        /**
         Query to search for. If the query is empty, returns up to 20 recently found chats
         */
        public let query: String

        /**
         Maximum number of chats to be returned
         */
        public let limit: Int

        /**
         Searches for the specified query in the title and username of already known chats, this is an offline request. Returns chats in the order seen in the chat list

         - Parameter query: Query to search for. If the query is empty, returns up to 20 recently found chats
         - Parameter limit: Maximum number of chats to be returned
         */
        public init(query: String, limit: Int) {
            self.query = query
            self.limit = limit
        }
    }
}
