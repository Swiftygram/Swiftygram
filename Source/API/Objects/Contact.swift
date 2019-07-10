//
//  Contact.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Describes a user contact
     */
    struct Contact: TDObjectProtocol {
        /**
         Phone number of the user
         */
        public var phoneNumber: String

        /**
         First name of the user; 1-255 characters in length
         */
        public var firstName: String

        /**
         Last name of the user
         */
        public var lastName: String

        /**
         Additional data about the user in a form of vCard; 0-2048 bytes in length
         */
        public var vcard: String

        /**
         Identifier of the user, if known; otherwise 0
         */
        public var userId: Int

        /**
         Describes a user contact

         - Parameter phoneNumber: Phone number of the user
         - Parameter firstName: First name of the user; 1-255 characters in length
         - Parameter lastName: Last name of the user
         - Parameter vcard: Additional data about the user in a form of vCard; 0-2048 bytes in length
         - Parameter userId: Identifier of the user, if known; otherwise 0
         */
        public init(phoneNumber: String, firstName: String, lastName: String, vcard: String, userId: Int) {
            self.phoneNumber = phoneNumber
            self.firstName = firstName
            self.lastName = lastName
            self.vcard = vcard
            self.userId = userId
        }
    }
}
