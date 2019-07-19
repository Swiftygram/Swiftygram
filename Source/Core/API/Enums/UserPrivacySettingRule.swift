//
//  UserPrivacySettingRule.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDEnum {
    /**
     Represents a single rule for managing privacy settings
     */
    enum UserPrivacySettingRule: TDEnumProtocol {
        /**
         A rule to allow all users to do something
         */
        case allowAll

        /**
         A rule to allow all of a user's contacts to do something
         */
        case allowContacts

        /**
         A rule to allow certain specified users to do something

         - userIds: The user identifiers
         */
        case allowUsers(userIds: [Int])

        /**
         A rule to restrict all users from doing something
         */
        case restrictAll

        /**
         A rule to restrict all contacts of a user from doing something
         */
        case restrictContacts

        /**
         A rule to restrict all specified users from doing something

         - userIds: The user identifiers
         */
        case restrictUsers(userIds: [Int])

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let type = try container.decode(String.self, forKey: .type)

            switch type {
            case "userPrivacySettingRuleAllowAll":
                self = .allowAll

            case "userPrivacySettingRuleAllowContacts":
                self = .allowContacts

            case "userPrivacySettingRuleAllowUsers":
                let userIds = try container.decode([Int].self, forKey: .init(string: "userIds"))

                self = .allowUsers(userIds: userIds)

            case "userPrivacySettingRuleRestrictAll":
                self = .restrictAll

            case "userPrivacySettingRuleRestrictContacts":
                self = .restrictContacts

            case "userPrivacySettingRuleRestrictUsers":
                let userIds = try container.decode([Int].self, forKey: .init(string: "userIds"))

                self = .restrictUsers(userIds: userIds)

            default:
                throw DecodingError.typeMismatch(UserPrivacySettingRule.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined UserPrivacySettingRule"))
            }
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            switch self {
            case .allowAll:
                try container.encode("userPrivacySettingRuleAllowAll", forKey: .type)

            case .allowContacts:
                try container.encode("userPrivacySettingRuleAllowContacts", forKey: .type)

            case let .allowUsers(userIds):
                try container.encode("userPrivacySettingRuleAllowUsers", forKey: .type)

                try container.encode(userIds, forKey: .init(string: "userIds"))

            case .restrictAll:
                try container.encode("userPrivacySettingRuleRestrictAll", forKey: .type)

            case .restrictContacts:
                try container.encode("userPrivacySettingRuleRestrictContacts", forKey: .type)

            case let .restrictUsers(userIds):
                try container.encode("userPrivacySettingRuleRestrictUsers", forKey: .type)

                try container.encode(userIds, forKey: .init(string: "userIds"))
            }
        }
    }
}
