//
//  ChatMembersFilter.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDEnum {
    /**
     Specifies the kind of chat members to return in searchChatMembers
     */
    enum ChatMembersFilter: TDEnumProtocol {
        /**
         Returns the creator and administrators
         */
        case administrators

        /**
         Returns all chat members, including restricted chat members
         */
        case members

        /**
         Returns users under certain restrictions in the chat; can be used only by administrators in a supergroup
         */
        case restricted

        /**
         Returns users banned from the chat; can be used only by administrators in a supergroup or in a channel
         */
        case banned

        /**
         Returns bot members of the chat
         */
        case bots

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let type = try container.decode(String.self, forKey: .type)

            switch type {
            case "chatMembersFilterAdministrators":
                self = .administrators

            case "chatMembersFilterMembers":
                self = .members

            case "chatMembersFilterRestricted":
                self = .restricted

            case "chatMembersFilterBanned":
                self = .banned

            case "chatMembersFilterBots":
                self = .bots

            default:
                throw DecodingError.typeMismatch(ChatMembersFilter.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined ChatMembersFilter"))
            }
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            switch self {
            case .administrators:
                try container.encode("chatMembersFilterAdministrators", forKey: .type)

            case .members:
                try container.encode("chatMembersFilterMembers", forKey: .type)

            case .restricted:
                try container.encode("chatMembersFilterRestricted", forKey: .type)

            case .banned:
                try container.encode("chatMembersFilterBanned", forKey: .type)

            case .bots:
                try container.encode("chatMembersFilterBots", forKey: .type)
            }
        }

        public var isAdministrators: Bool {
            if case .administrators = self {
                return true
            } else {
                return false
            }
        }

        public var isMembers: Bool {
            if case .members = self {
                return true
            } else {
                return false
            }
        }

        public var isRestricted: Bool {
            if case .restricted = self {
                return true
            } else {
                return false
            }
        }

        public var isBanned: Bool {
            if case .banned = self {
                return true
            } else {
                return false
            }
        }

        public var isBots: Bool {
            if case .bots = self {
                return true
            } else {
                return false
            }
        }
    }
}
