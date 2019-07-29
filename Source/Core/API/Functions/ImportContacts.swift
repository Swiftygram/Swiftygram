//
//  ImportContacts.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Adds new contacts or edits existing contacts; contacts' user identifiers are ignored

     - ReturnType: `TDObject.ImportedContacts`
     */
    struct ImportContacts: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.ImportedContacts

        /**
         The list of contacts to import or edit, contact's vCard are ignored and are not imported
         */
        public var contacts: [TDObject.Contact]

        /**
         Adds new contacts or edits existing contacts; contacts' user identifiers are ignored

         - Parameter contacts: The list of contacts to import or edit, contact's vCard are ignored and are not imported
         */
        public init(contacts: [TDObject.Contact]) {
            self.contacts = contacts
        }
    }
}
