//
//  ChatType.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDEnum {
    /**
     Describes the type of a chat
     */
    enum ChatType: TDEnumProtocol {
        /**
         An ordinary chat with a user

         - userId: User identifier
         */
        case `private`(userId: Int)

        /**
         A basic group (i.e., a chat with 0-200 other users)

         - basicGroupId: Basic group identifier
         */
        case basicGroup(basicGroupId: Int)

        /**
         A supergroup (i.e. a chat with up to GetOption("supergroup_max_size") other users), or channel (with unlimited members)

         - supergroupId: Supergroup or channel identifier
         - isChannel: True, if the supergroup is a channel
         */
        case supergroup(supergroupId: Int, isChannel: Bool)

        /**
         A secret chat with a user

         - secretChatId: Secret chat identifier
         - userId: User identifier of the secret chat peer
         */
        case secret(secretChatId: Int, userId: Int)

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let type = try container.decode(String.self, forKey: .type)

            switch type {
            case "chatTypePrivate":
                let userId = try container.decode(Int.self, forKey: .init(string: "userId"))

                self = .private(userId: userId)

            case "chatTypeBasicGroup":
                let basicGroupId = try container.decode(Int.self, forKey: .init(string: "basicGroupId"))

                self = .basicGroup(basicGroupId: basicGroupId)

            case "chatTypeSupergroup":
                let supergroupId = try container.decode(Int.self, forKey: .init(string: "supergroupId"))
                let isChannel = try container.decode(Bool.self, forKey: .init(string: "isChannel"))

                self = .supergroup(supergroupId: supergroupId, isChannel: isChannel)

            case "chatTypeSecret":
                let secretChatId = try container.decode(Int.self, forKey: .init(string: "secretChatId"))
                let userId = try container.decode(Int.self, forKey: .init(string: "userId"))

                self = .secret(secretChatId: secretChatId, userId: userId)

            default:
                throw DecodingError.typeMismatch(ChatType.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined ChatType"))
            }
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            switch self {
            case let .private(userId):
                try container.encode("chatTypePrivate", forKey: .type)

                try container.encode(userId, forKey: .init(string: "userId"))

            case let .basicGroup(basicGroupId):
                try container.encode("chatTypeBasicGroup", forKey: .type)

                try container.encode(basicGroupId, forKey: .init(string: "basicGroupId"))

            case let .supergroup(supergroupId, isChannel):
                try container.encode("chatTypeSupergroup", forKey: .type)

                try container.encode(supergroupId, forKey: .init(string: "supergroupId"))
                try container.encode(isChannel, forKey: .init(string: "isChannel"))

            case let .secret(secretChatId, userId):
                try container.encode("chatTypeSecret", forKey: .type)

                try container.encode(secretChatId, forKey: .init(string: "secretChatId"))
                try container.encode(userId, forKey: .init(string: "userId"))
            }
        }

        public var isPrivate: Bool {
            if case .private = self {
                return true
            } else {
                return false
            }
        }

        public var isBasicGroup: Bool {
            if case .basicGroup = self {
                return true
            } else {
                return false
            }
        }

        public var isSupergroup: Bool {
            if case .supergroup = self {
                return true
            } else {
                return false
            }
        }

        public var isSecret: Bool {
            if case .secret = self {
                return true
            } else {
                return false
            }
        }
    }
}
