//
//  User.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Represents a user
     */
    struct User: TDObjectProtocol {
        /**
         User identifier
         */
        public var id: Int

        /**
         First name of the user
         */
        public var firstName: String

        /**
         Last name of the user
         */
        public var lastName: String

        /**
         Username of the user
         */
        public var username: String

        /**
         Phone number of the user
         */
        public var phoneNumber: String

        /**
         Current online status of the user
         */
        public var status: TDEnum.UserStatus

        /**
         Profile photo of the user; may be null
         */
        public var profilePhoto: TDObject.ProfilePhoto?

        /**
         Relationship from the current user to the other user
         */
        public var outgoingLink: TDEnum.LinkState

        /**
         Relationship from the other user to the current user
         */
        public var incomingLink: TDEnum.LinkState

        /**
         True, if the user is verified
         */
        public var isVerified: Bool

        /**
         True, if the user is Telegram support account
         */
        public var isSupport: Bool

        /**
         If non-empty, it contains the reason why access to this user must be restricted. The format of the string is "{type}: {description}".-{type} contains the type of the restriction and at least one of the suffixes "-all", "-ios", "-android", or "-wp", which describe the platforms on which access should be restricted. (For example, "terms-ios-android". {description} contains a human-readable description of the restriction, which can be shown to the user)
         */
        public var restrictionReason: String

        /**
         If false, the user is inaccessible, and the only information known about the user is inside this class. It can't be passed to any method except GetUser
         */
        public var haveAccess: Bool

        /**
         Type of the user
         */
        public var type: TDEnum.UserType

        /**
         IETF language tag of the user's language; only available to bots
         */
        public var languageCode: String

        /**
         Represents a user

         - Parameter id: User identifier
         - Parameter firstName: First name of the user
         - Parameter lastName: Last name of the user
         - Parameter username: Username of the user
         - Parameter phoneNumber: Phone number of the user
         - Parameter status: Current online status of the user
         - Parameter profilePhoto: Profile photo of the user; may be null
         - Parameter outgoingLink: Relationship from the current user to the other user
         - Parameter incomingLink: Relationship from the other user to the current user
         - Parameter isVerified: True, if the user is verified
         - Parameter isSupport: True, if the user is Telegram support account
         - Parameter restrictionReason: If non-empty, it contains the reason why access to this user must be restricted. The format of the string is "{type}: {description}".-{type} contains the type of the restriction and at least one of the suffixes "-all", "-ios", "-android", or "-wp", which describe the platforms on which access should be restricted. (For example, "terms-ios-android". {description} contains a human-readable description of the restriction, which can be shown to the user)
         - Parameter haveAccess: If false, the user is inaccessible, and the only information known about the user is inside this class. It can't be passed to any method except GetUser
         - Parameter type: Type of the user
         - Parameter languageCode: IETF language tag of the user's language; only available to bots
         */
        public init(id: Int, firstName: String, lastName: String, username: String, phoneNumber: String, status: TDEnum.UserStatus, profilePhoto: TDObject.ProfilePhoto?, outgoingLink: TDEnum.LinkState, incomingLink: TDEnum.LinkState, isVerified: Bool, isSupport: Bool, restrictionReason: String, haveAccess: Bool, type: TDEnum.UserType, languageCode: String) {
            self.id = id
            self.firstName = firstName
            self.lastName = lastName
            self.username = username
            self.phoneNumber = phoneNumber
            self.status = status
            self.profilePhoto = profilePhoto
            self.outgoingLink = outgoingLink
            self.incomingLink = incomingLink
            self.isVerified = isVerified
            self.isSupport = isSupport
            self.restrictionReason = restrictionReason
            self.haveAccess = haveAccess
            self.type = type
            self.languageCode = languageCode
        }
    }
}
