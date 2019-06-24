//
//  NotificationSettingsScope.swift
//  Swiftygram
//  Created by ky1vstar on 6/24/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDEnum {
    enum NotificationSettingsScope: TDEnumProtocol {
        ///  Notification settings applied to all private and secret chats when
        /// the corresponding chat setting has a default value
        case privateChats

        ///  Notification settings applied to all basic groups and supergroups
        /// when the corresponding chat setting has a default value
        case groupChats

        ///  Notification settings applied to all channels when the corresponding
        /// chat setting has a default value
        case channelChats

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let type = try container.decode(String.self, forKey: .type)

            switch type {
            case "notificationSettingsScopePrivateChats":
                self = .privateChats

            case "notificationSettingsScopeGroupChats":
                self = .groupChats

            case "notificationSettingsScopeChannelChats":
                self = .channelChats

            default:
                throw DecodingError.typeMismatch(NotificationSettingsScope.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined NotificationSettingsScope"))
            }
        }

        // MARK: - Decodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            switch self {
            case .privateChats:
                try container.encode("notificationSettingsScopePrivateChats", forKey: .type)

            case .groupChats:
                try container.encode("notificationSettingsScopeGroupChats", forKey: .type)

            case .channelChats:
                try container.encode("notificationSettingsScopeChannelChats", forKey: .type)
            }
        }
    }
}
