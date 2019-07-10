//
//  ImportedContacts.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Represents the result of an ImportContacts request
     */
    struct ImportedContacts: TDObjectProtocol {
        /**
         User identifiers of the imported contacts in the same order as they were specified in the request; 0 if the contact is not yet a registered user
         */
        public var userIds: [Int]

        /**
         The number of users that imported the corresponding contact; 0 for already registered users or if unavailable
         */
        public var importerCount: [Int]

        /**
         Represents the result of an ImportContacts request

         - Parameter userIds: User identifiers of the imported contacts in the same order as they were specified in the request; 0 if the contact is not yet a registered user
         - Parameter importerCount: The number of users that imported the corresponding contact; 0 for already registered users or if unavailable
         */
        public init(userIds: [Int], importerCount: [Int]) {
            self.userIds = userIds
            self.importerCount = importerCount
        }
    }
}
