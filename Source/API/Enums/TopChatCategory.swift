//
//  TopChatCategory.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDEnum {
    /**
     Represents the categories of chats for which a list of frequently used chats can be retrieved
     */
    enum TopChatCategory: TDEnumProtocol {
        /**
         A category containing frequently used private chats with non-bot users
         */
        case users

        /**
         A category containing frequently used private chats with bot users
         */
        case bots

        /**
         A category containing frequently used basic groups and supergroups
         */
        case groups

        /**
         A category containing frequently used channels
         */
        case channels

        /**
         A category containing frequently used chats with inline bots sorted by their usage in inline mode
         */
        case inlineBots

        /**
         A category containing frequently used chats used for calls
         */
        case calls

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let type = try container.decode(String.self, forKey: .type)

            switch type {
            case "topChatCategoryUsers":
                self = .users

            case "topChatCategoryBots":
                self = .bots

            case "topChatCategoryGroups":
                self = .groups

            case "topChatCategoryChannels":
                self = .channels

            case "topChatCategoryInlineBots":
                self = .inlineBots

            case "topChatCategoryCalls":
                self = .calls

            default:
                throw DecodingError.typeMismatch(TopChatCategory.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined TopChatCategory"))
            }
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            switch self {
            case .users:
                try container.encode("topChatCategoryUsers", forKey: .type)

            case .bots:
                try container.encode("topChatCategoryBots", forKey: .type)

            case .groups:
                try container.encode("topChatCategoryGroups", forKey: .type)

            case .channels:
                try container.encode("topChatCategoryChannels", forKey: .type)

            case .inlineBots:
                try container.encode("topChatCategoryInlineBots", forKey: .type)

            case .calls:
                try container.encode("topChatCategoryCalls", forKey: .type)
            }
        }
    }
}
