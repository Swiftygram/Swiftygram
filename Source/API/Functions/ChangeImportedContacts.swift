//
//  ChangeImportedContacts.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Changes imported contacts using the list of current user contacts saved on the device. Imports newly added contacts and, if at least the file database is enabled, deletes recently deleted contacts.-Query result depends on the result of the previous query, so only one query is possible at the same time

     - ReturnType: `TDObject.ImportedContacts`
     */
    struct ChangeImportedContacts: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.ImportedContacts

        /**
         The new list of contacts, contact's vCard are ignored and are not imported
         */
        public let contacts: [TDObject.Contact]

        /**
         Changes imported contacts using the list of current user contacts saved on the device. Imports newly added contacts and, if at least the file database is enabled, deletes recently deleted contacts.-Query result depends on the result of the previous query, so only one query is possible at the same time

         - Parameter contacts: The new list of contacts, contact's vCard are ignored and are not imported
         */
        public init(contacts: [TDObject.Contact]) {
            self.contacts = contacts
        }
    }
}
