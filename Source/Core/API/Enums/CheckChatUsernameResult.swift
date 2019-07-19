//
//  CheckChatUsernameResult.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDEnum {
    /**
     Represents result of checking whether a username can be set for a chat
     */
    enum CheckChatUsernameResult: TDEnumProtocol {
        /**
         The username can be set
         */
        case ok

        /**
         The username is invalid
         */
        case usernameInvalid

        /**
         The username is occupied
         */
        case usernameOccupied

        /**
         The user has too much public chats, one of them should be made private first
         */
        case publicChatsTooMuch

        /**
         The user can't be a member of a public supergroup
         */
        case publicGroupsUnavailable

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let type = try container.decode(String.self, forKey: .type)

            switch type {
            case "checkChatUsernameResultOk":
                self = .ok

            case "checkChatUsernameResultUsernameInvalid":
                self = .usernameInvalid

            case "checkChatUsernameResultUsernameOccupied":
                self = .usernameOccupied

            case "checkChatUsernameResultPublicChatsTooMuch":
                self = .publicChatsTooMuch

            case "checkChatUsernameResultPublicGroupsUnavailable":
                self = .publicGroupsUnavailable

            default:
                throw DecodingError.typeMismatch(CheckChatUsernameResult.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined CheckChatUsernameResult"))
            }
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            switch self {
            case .ok:
                try container.encode("checkChatUsernameResultOk", forKey: .type)

            case .usernameInvalid:
                try container.encode("checkChatUsernameResultUsernameInvalid", forKey: .type)

            case .usernameOccupied:
                try container.encode("checkChatUsernameResultUsernameOccupied", forKey: .type)

            case .publicChatsTooMuch:
                try container.encode("checkChatUsernameResultPublicChatsTooMuch", forKey: .type)

            case .publicGroupsUnavailable:
                try container.encode("checkChatUsernameResultPublicGroupsUnavailable", forKey: .type)
            }
        }
    }
}
