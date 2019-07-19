//
//  ChatMemberStatus.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDEnum {
    /**
     Provides information about the status of a member in a chat
     */
    enum ChatMemberStatus: TDEnumProtocol {
        /**
         The user is the creator of a chat and has all the administrator privileges

         - isMember: True, if the user is a member of the chat
         */
        case creator(isMember: Bool)

        /**
         The user is a member of a chat and has some additional privileges. In basic groups, administrators can edit and delete messages sent by others, add new members, and ban unprivileged members. In supergroups and channels, there are more detailed options for administrator privileges

         - canBeEdited: True, if the current user can edit the administrator privileges for the called user
         - canChangeInfo: True, if the administrator can change the chat title, photo, and other settings
         - canPostMessages: True, if the administrator can create channel posts; applicable to channels only
         - canEditMessages: True, if the administrator can edit messages of other users and pin messages; applicable to channels only
         - canDeleteMessages: True, if the administrator can delete messages of other users
         - canInviteUsers: True, if the administrator can invite new users to the chat
         - canRestrictMembers: True, if the administrator can restrict, ban, or unban chat members
         - canPinMessages: True, if the administrator can pin messages; applicable to groups only
         - canPromoteMembers: True, if the administrator can add new administrators with a subset of his own privileges or demote administrators that were directly or indirectly promoted by him
         */
        case administrator(canBeEdited: Bool, canChangeInfo: Bool, canPostMessages: Bool, canEditMessages: Bool, canDeleteMessages: Bool, canInviteUsers: Bool, canRestrictMembers: Bool, canPinMessages: Bool, canPromoteMembers: Bool)

        /**
         The user is a member of a chat, without any additional privileges or restrictions
         */
        case member

        /**
         The user is under certain restrictions in the chat. Not supported in basic groups and channels

         - isMember: True, if the user is a member of the chat
         - restrictedUntilDate: Point in time (Unix timestamp) when restrictions will be lifted from the user; 0 if never. If the user is restricted for more than 366 days or for less than 30 seconds from the current time, the user is considered to be restricted forever
         - canSendMessages: True, if the user can send text messages, contacts, locations, and venues
         - canSendMediaMessages: True, if the user can send audio files, documents, photos, videos, video notes, and voice notes. Implies can_send_messages permissions
         - canSendOtherMessages: True, if the user can send animations, games, and stickers and use inline bots. Implies can_send_media_messages permissions
         - canAddWebPagePreviews: True, if the user may add a web page preview to his messages. Implies can_send_messages permissions
         */
        case restricted(isMember: Bool, restrictedUntilDate: Foundation.Date, canSendMessages: Bool, canSendMediaMessages: Bool, canSendOtherMessages: Bool, canAddWebPagePreviews: Bool)

        /**
         The user is not a chat member
         */
        case left

        /**
         The user was banned (and hence is not a member of the chat). Implies the user can't return to the chat or view messages

         - bannedUntilDate: Point in time (Unix timestamp) when the user will be unbanned; 0 if never. If the user is banned for more than 366 days or for less than 30 seconds from the current time, the user is considered to be banned forever
         */
        case banned(bannedUntilDate: Foundation.Date)

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let type = try container.decode(String.self, forKey: .type)

            switch type {
            case "chatMemberStatusCreator":
                let isMember = try container.decode(Bool.self, forKey: .init(string: "isMember"))

                self = .creator(isMember: isMember)

            case "chatMemberStatusAdministrator":
                let canBeEdited = try container.decode(Bool.self, forKey: .init(string: "canBeEdited"))
                let canChangeInfo = try container.decode(Bool.self, forKey: .init(string: "canChangeInfo"))
                let canPostMessages = try container.decode(Bool.self, forKey: .init(string: "canPostMessages"))
                let canEditMessages = try container.decode(Bool.self, forKey: .init(string: "canEditMessages"))
                let canDeleteMessages = try container.decode(Bool.self, forKey: .init(string: "canDeleteMessages"))
                let canInviteUsers = try container.decode(Bool.self, forKey: .init(string: "canInviteUsers"))
                let canRestrictMembers = try container.decode(Bool.self, forKey: .init(string: "canRestrictMembers"))
                let canPinMessages = try container.decode(Bool.self, forKey: .init(string: "canPinMessages"))
                let canPromoteMembers = try container.decode(Bool.self, forKey: .init(string: "canPromoteMembers"))

                self = .administrator(canBeEdited: canBeEdited, canChangeInfo: canChangeInfo, canPostMessages: canPostMessages, canEditMessages: canEditMessages, canDeleteMessages: canDeleteMessages, canInviteUsers: canInviteUsers, canRestrictMembers: canRestrictMembers, canPinMessages: canPinMessages, canPromoteMembers: canPromoteMembers)

            case "chatMemberStatusMember":
                self = .member

            case "chatMemberStatusRestricted":
                let isMember = try container.decode(Bool.self, forKey: .init(string: "isMember"))
                let restrictedUntilDate = try container.decodeDate(forKey: .init(string: "restrictedUntilDate"))
                let canSendMessages = try container.decode(Bool.self, forKey: .init(string: "canSendMessages"))
                let canSendMediaMessages = try container.decode(Bool.self, forKey: .init(string: "canSendMediaMessages"))
                let canSendOtherMessages = try container.decode(Bool.self, forKey: .init(string: "canSendOtherMessages"))
                let canAddWebPagePreviews = try container.decode(Bool.self, forKey: .init(string: "canAddWebPagePreviews"))

                self = .restricted(isMember: isMember, restrictedUntilDate: restrictedUntilDate, canSendMessages: canSendMessages, canSendMediaMessages: canSendMediaMessages, canSendOtherMessages: canSendOtherMessages, canAddWebPagePreviews: canAddWebPagePreviews)

            case "chatMemberStatusLeft":
                self = .left

            case "chatMemberStatusBanned":
                let bannedUntilDate = try container.decodeDate(forKey: .init(string: "bannedUntilDate"))

                self = .banned(bannedUntilDate: bannedUntilDate)

            default:
                throw DecodingError.typeMismatch(ChatMemberStatus.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined ChatMemberStatus"))
            }
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            switch self {
            case let .creator(isMember):
                try container.encode("chatMemberStatusCreator", forKey: .type)

                try container.encode(isMember, forKey: .init(string: "isMember"))

            case let .administrator(canBeEdited, canChangeInfo, canPostMessages, canEditMessages, canDeleteMessages, canInviteUsers, canRestrictMembers, canPinMessages, canPromoteMembers):
                try container.encode("chatMemberStatusAdministrator", forKey: .type)

                try container.encode(canBeEdited, forKey: .init(string: "canBeEdited"))
                try container.encode(canChangeInfo, forKey: .init(string: "canChangeInfo"))
                try container.encode(canPostMessages, forKey: .init(string: "canPostMessages"))
                try container.encode(canEditMessages, forKey: .init(string: "canEditMessages"))
                try container.encode(canDeleteMessages, forKey: .init(string: "canDeleteMessages"))
                try container.encode(canInviteUsers, forKey: .init(string: "canInviteUsers"))
                try container.encode(canRestrictMembers, forKey: .init(string: "canRestrictMembers"))
                try container.encode(canPinMessages, forKey: .init(string: "canPinMessages"))
                try container.encode(canPromoteMembers, forKey: .init(string: "canPromoteMembers"))

            case .member:
                try container.encode("chatMemberStatusMember", forKey: .type)

            case let .restricted(isMember, restrictedUntilDate, canSendMessages, canSendMediaMessages, canSendOtherMessages, canAddWebPagePreviews):
                try container.encode("chatMemberStatusRestricted", forKey: .type)

                try container.encode(isMember, forKey: .init(string: "isMember"))
                try container.encodeDate(restrictedUntilDate, forKey: .init(string: "restrictedUntilDate"))
                try container.encode(canSendMessages, forKey: .init(string: "canSendMessages"))
                try container.encode(canSendMediaMessages, forKey: .init(string: "canSendMediaMessages"))
                try container.encode(canSendOtherMessages, forKey: .init(string: "canSendOtherMessages"))
                try container.encode(canAddWebPagePreviews, forKey: .init(string: "canAddWebPagePreviews"))

            case .left:
                try container.encode("chatMemberStatusLeft", forKey: .type)

            case let .banned(bannedUntilDate):
                try container.encode("chatMemberStatusBanned", forKey: .type)

                try container.encodeDate(bannedUntilDate, forKey: .init(string: "bannedUntilDate"))
            }
        }
    }
}
