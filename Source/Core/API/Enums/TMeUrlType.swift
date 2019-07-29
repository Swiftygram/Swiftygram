//
//  TMeUrlType.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDEnum {
    /**
     Describes the type of a URL linking to an internal Telegram entity
     */
    enum TMeUrlType: TDEnumProtocol {
        /**
         A URL linking to a user

         - userId: Identifier of the user
         */
        case user(userId: Int)

        /**
         A URL linking to a public supergroup or channel

         - supergroupId: Identifier of the supergroup or channel
         */
        case supergroup(supergroupId: Int64)

        /**
         A chat invite link

         - info: Chat invite link info
         */
        case chatInvite(info: TDObject.ChatInviteLinkInfo)

        /**
         A URL linking to a sticker set

         - stickerSetId: Identifier of the sticker set
         */
        case stickerSet(stickerSetId: Int64)

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let type = try container.decode(String.self, forKey: .type)

            switch type {
            case "tMeUrlTypeUser":
                let userId = try container.decode(Int.self, forKey: .init(string: "userId"))

                self = .user(userId: userId)

            case "tMeUrlTypeSupergroup":
                let supergroupId = try container.decodeInt64(forKey: .init(string: "supergroupId"))

                self = .supergroup(supergroupId: supergroupId)

            case "tMeUrlTypeChatInvite":
                let info = try container.decode(TDObject.ChatInviteLinkInfo.self, forKey: .init(string: "info"))

                self = .chatInvite(info: info)

            case "tMeUrlTypeStickerSet":
                let stickerSetId = try container.decodeInt64(forKey: .init(string: "stickerSetId"))

                self = .stickerSet(stickerSetId: stickerSetId)

            default:
                throw DecodingError.typeMismatch(TMeUrlType.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined TMeUrlType"))
            }
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            switch self {
            case let .user(userId):
                try container.encode("tMeUrlTypeUser", forKey: .type)

                try container.encode(userId, forKey: .init(string: "userId"))

            case let .supergroup(supergroupId):
                try container.encode("tMeUrlTypeSupergroup", forKey: .type)

                try container.encodeInt64(supergroupId, forKey: .init(string: "supergroupId"))

            case let .chatInvite(info):
                try container.encode("tMeUrlTypeChatInvite", forKey: .type)

                try container.encode(info, forKey: .init(string: "info"))

            case let .stickerSet(stickerSetId):
                try container.encode("tMeUrlTypeStickerSet", forKey: .type)

                try container.encodeInt64(stickerSetId, forKey: .init(string: "stickerSetId"))
            }
        }

        public var isUser: Bool {
            if case .user = self {
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

        public var isChatInvite: Bool {
            if case .chatInvite = self {
                return true
            } else {
                return false
            }
        }

        public var isStickerSet: Bool {
            if case .stickerSet = self {
                return true
            } else {
                return false
            }
        }
    }
}
