//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Represents a supergroup or channel with zero or more members (subscribers in the case of channels). From the point of view of the system, a channel is a special kind of a supergroup: only administrators can post and see the list of members, and posts from all administrators use the name and photo of the channel instead of individual names and profile photos. Unlike supergroups, channels can have an unlimited number of subscribers
     */
    struct Supergroup: TDObjectProtocol {
        /**
         Supergroup or channel identifier
         */
        public var id: Int

        /**
         Username of the supergroup or channel; empty for private supergroups or channels
         */
        public var username: String

        /**
         Point in time (Unix timestamp) when the current user joined, or the point in time when the supergroup or channel was created, in case the user is not a member
         */
        public var date: Foundation.Date

        /**
         Status of the current user in the supergroup or channel
         */
        public var status: TDEnum.ChatMemberStatus

        /**
         Member count; 0 if unknown. Currently it is guaranteed to be known only if the supergroup or channel was found through SearchPublicChats
         */
        public var memberCount: Int

        /**
         True, if any member of the supergroup can invite other members. This field has no meaning for channels
         */
        public var anyoneCanInvite: Bool

        /**
         True, if messages sent to the channel should contain information about the sender. This field is only applicable to channels
         */
        public var signMessages: Bool

        /**
         True, if the supergroup is a channel
         */
        public var isChannel: Bool

        /**
         True, if the supergroup or channel is verified
         */
        public var isVerified: Bool

        /**
         If non-empty, contains the reason why access to this supergroup or channel must be restricted. Format of the string is "{type}: {description}".-{type} Contains the type of the restriction and at least one of the suffixes "-all", "-ios", "-android", or "-wp", which describe the platforms on which access should be restricted. (For example, "terms-ios-android". {description} contains a human-readable description of the restriction, which can be shown to the user)
         */
        public var restrictionReason: String

        /**
         Represents a supergroup or channel with zero or more members (subscribers in the case of channels). From the point of view of the system, a channel is a special kind of a supergroup: only administrators can post and see the list of members, and posts from all administrators use the name and photo of the channel instead of individual names and profile photos. Unlike supergroups, channels can have an unlimited number of subscribers

         - Parameter id: Supergroup or channel identifier
         - Parameter username: Username of the supergroup or channel; empty for private supergroups or channels
         - Parameter date: Point in time (Unix timestamp) when the current user joined, or the point in time when the supergroup or channel was created, in case the user is not a member
         - Parameter status: Status of the current user in the supergroup or channel
         - Parameter memberCount: Member count; 0 if unknown. Currently it is guaranteed to be known only if the supergroup or channel was found through SearchPublicChats
         - Parameter anyoneCanInvite: True, if any member of the supergroup can invite other members. This field has no meaning for channels
         - Parameter signMessages: True, if messages sent to the channel should contain information about the sender. This field is only applicable to channels
         - Parameter isChannel: True, if the supergroup is a channel
         - Parameter isVerified: True, if the supergroup or channel is verified
         - Parameter restrictionReason: If non-empty, contains the reason why access to this supergroup or channel must be restricted. Format of the string is "{type}: {description}".-{type} Contains the type of the restriction and at least one of the suffixes "-all", "-ios", "-android", or "-wp", which describe the platforms on which access should be restricted. (For example, "terms-ios-android". {description} contains a human-readable description of the restriction, which can be shown to the user)
         */
        public init(id: Int, username: String, date: Foundation.Date, status: TDEnum.ChatMemberStatus, memberCount: Int, anyoneCanInvite: Bool, signMessages: Bool, isChannel: Bool, isVerified: Bool, restrictionReason: String) {
            self.id = id
            self.username = username
            self.date = date
            self.status = status
            self.memberCount = memberCount
            self.anyoneCanInvite = anyoneCanInvite
            self.signMessages = signMessages
            self.isChannel = isChannel
            self.isVerified = isVerified
            self.restrictionReason = restrictionReason
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            id = try container.decode(Int.self, forKey: .init(string: "id"))
            username = try container.decode(String.self, forKey: .init(string: "username"))
            date = try container.decodeDate(forKey: .init(string: "date"))
            status = try container.decode(TDEnum.ChatMemberStatus.self, forKey: .init(string: "status"))
            memberCount = try container.decode(Int.self, forKey: .init(string: "memberCount"))
            anyoneCanInvite = try container.decode(Bool.self, forKey: .init(string: "anyoneCanInvite"))
            signMessages = try container.decode(Bool.self, forKey: .init(string: "signMessages"))
            isChannel = try container.decode(Bool.self, forKey: .init(string: "isChannel"))
            isVerified = try container.decode(Bool.self, forKey: .init(string: "isVerified"))
            restrictionReason = try container.decode(String.self, forKey: .init(string: "restrictionReason"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encode(id, forKey: .init(string: "id"))
            try container.encode(username, forKey: .init(string: "username"))
            try container.encodeDate(date, forKey: .init(string: "date"))
            try container.encode(status, forKey: .init(string: "status"))
            try container.encode(memberCount, forKey: .init(string: "memberCount"))
            try container.encode(anyoneCanInvite, forKey: .init(string: "anyoneCanInvite"))
            try container.encode(signMessages, forKey: .init(string: "signMessages"))
            try container.encode(isChannel, forKey: .init(string: "isChannel"))
            try container.encode(isVerified, forKey: .init(string: "isVerified"))
            try container.encode(restrictionReason, forKey: .init(string: "restrictionReason"))
        }
    }
}
