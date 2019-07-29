//
//  UserPrivacySetting.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDEnum {
    /**
     Describes available user privacy settings
     */
    enum UserPrivacySetting: TDEnumProtocol {
        /**
         A privacy setting for managing whether the user's online status is visible
         */
        case showStatus

        /**
         A privacy setting for managing whether the user can be invited to chats
         */
        case allowChatInvites

        /**
         A privacy setting for managing whether the user can be called
         */
        case allowCalls

        /**
         A privacy setting for managing whether peer-to-peer connections can be used for calls
         */
        case allowPeerToPeerCalls

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let type = try container.decode(String.self, forKey: .type)

            switch type {
            case "userPrivacySettingShowStatus":
                self = .showStatus

            case "userPrivacySettingAllowChatInvites":
                self = .allowChatInvites

            case "userPrivacySettingAllowCalls":
                self = .allowCalls

            case "userPrivacySettingAllowPeerToPeerCalls":
                self = .allowPeerToPeerCalls

            default:
                throw DecodingError.typeMismatch(UserPrivacySetting.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined UserPrivacySetting"))
            }
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            switch self {
            case .showStatus:
                try container.encode("userPrivacySettingShowStatus", forKey: .type)

            case .allowChatInvites:
                try container.encode("userPrivacySettingAllowChatInvites", forKey: .type)

            case .allowCalls:
                try container.encode("userPrivacySettingAllowCalls", forKey: .type)

            case .allowPeerToPeerCalls:
                try container.encode("userPrivacySettingAllowPeerToPeerCalls", forKey: .type)
            }
        }

        public var isShowStatus: Bool {
            if case .showStatus = self {
                return true
            } else {
                return false
            }
        }

        public var isAllowChatInvites: Bool {
            if case .allowChatInvites = self {
                return true
            } else {
                return false
            }
        }

        public var isAllowCalls: Bool {
            if case .allowCalls = self {
                return true
            } else {
                return false
            }
        }

        public var isAllowPeerToPeerCalls: Bool {
            if case .allowPeerToPeerCalls = self {
                return true
            } else {
                return false
            }
        }
    }
}
