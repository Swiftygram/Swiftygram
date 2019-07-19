//
//  SearchContacts.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Searches for the specified query in the first names, last names and usernames of the known user contacts

     - ReturnType: `TDObject.Users`
     */
    struct SearchContacts: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Users

        /**
         Query to search for; may be empty to return all contacts
         */
        public var query: String

        /**
         Maximum number of users to be returned
         */
        public var limit: Int

        /**
         Searches for the specified query in the first names, last names and usernames of the known user contacts

         - Parameter query: Query to search for; may be empty to return all contacts
         - Parameter limit: Maximum number of users to be returned
         */
        public init(query: String, limit: Int) {
            self.query = query
            self.limit = limit
        }
    }
}
