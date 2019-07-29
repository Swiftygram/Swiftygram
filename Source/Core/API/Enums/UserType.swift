//
//  UserType.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDEnum {
    /**
     Represents the type of the user. The following types are possible: regular users, deleted users and bots
     */
    enum UserType: TDEnumProtocol {
        /**
         A regular user
         */
        case regular

        /**
         A deleted user or deleted bot. No information on the user besides the user_id is available. It is not possible to perform any active actions on this type of user
         */
        case deleted

        /**
         A bot (see https://core.telegram.org/bots)

         - canJoinGroups: True, if the bot can be invited to basic group and supergroup chats
         - canReadAllGroupMessages: True, if the bot can read all messages in basic group or supergroup chats and not just those addressed to the bot. In private and channel chats a bot can always read all messages
         - isInline: True, if the bot supports inline queries
         - inlineQueryPlaceholder: Placeholder for inline queries (displayed on the client input field)
         - needLocation: True, if the location of the user should be sent with every inline query to this bot
         */
        case bot(canJoinGroups: Bool, canReadAllGroupMessages: Bool, isInline: Bool, inlineQueryPlaceholder: String, needLocation: Bool)

        /**
         No information on the user besides the user_id is available, yet this user has not been deleted. This object is extremely rare and must be handled like a deleted user. It is not possible to perform any actions on users of this type
         */
        case unknown

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let type = try container.decode(String.self, forKey: .type)

            switch type {
            case "userTypeRegular":
                self = .regular

            case "userTypeDeleted":
                self = .deleted

            case "userTypeBot":
                let canJoinGroups = try container.decode(Bool.self, forKey: .init(string: "canJoinGroups"))
                let canReadAllGroupMessages = try container.decode(Bool.self, forKey: .init(string: "canReadAllGroupMessages"))
                let isInline = try container.decode(Bool.self, forKey: .init(string: "isInline"))
                let inlineQueryPlaceholder = try container.decode(String.self, forKey: .init(string: "inlineQueryPlaceholder"))
                let needLocation = try container.decode(Bool.self, forKey: .init(string: "needLocation"))

                self = .bot(canJoinGroups: canJoinGroups, canReadAllGroupMessages: canReadAllGroupMessages, isInline: isInline, inlineQueryPlaceholder: inlineQueryPlaceholder, needLocation: needLocation)

            case "userTypeUnknown":
                self = .unknown

            default:
                throw DecodingError.typeMismatch(UserType.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined UserType"))
            }
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            switch self {
            case .regular:
                try container.encode("userTypeRegular", forKey: .type)

            case .deleted:
                try container.encode("userTypeDeleted", forKey: .type)

            case let .bot(canJoinGroups, canReadAllGroupMessages, isInline, inlineQueryPlaceholder, needLocation):
                try container.encode("userTypeBot", forKey: .type)

                try container.encode(canJoinGroups, forKey: .init(string: "canJoinGroups"))
                try container.encode(canReadAllGroupMessages, forKey: .init(string: "canReadAllGroupMessages"))
                try container.encode(isInline, forKey: .init(string: "isInline"))
                try container.encode(inlineQueryPlaceholder, forKey: .init(string: "inlineQueryPlaceholder"))
                try container.encode(needLocation, forKey: .init(string: "needLocation"))

            case .unknown:
                try container.encode("userTypeUnknown", forKey: .type)
            }
        }

        public var isRegular: Bool {
            if case .regular = self {
                return true
            } else {
                return false
            }
        }

        public var isDeleted: Bool {
            if case .deleted = self {
                return true
            } else {
                return false
            }
        }

        public var isBot: Bool {
            if case .bot = self {
                return true
            } else {
                return false
            }
        }

        public var isUnknown: Bool {
            if case .unknown = self {
                return true
            } else {
                return false
            }
        }
    }
}
