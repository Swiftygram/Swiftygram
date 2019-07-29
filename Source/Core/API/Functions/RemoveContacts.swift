//
//  RemoveContacts.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Removes users from the contact list

     - ReturnType: `TDObject.Ok`
     */
    struct RemoveContacts: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Identifiers of users to be deleted
         */
        public var userIds: [Int]

        /**
         Removes users from the contact list

         - Parameter userIds: Identifiers of users to be deleted
         */
        public init(userIds: [Int]) {
            self.userIds = userIds
        }
    }
}
