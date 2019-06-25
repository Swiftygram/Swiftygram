//
//  UserStatus.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDEnum {
    /**
     Describes the last time the user was online
     */
    enum UserStatus: TDEnumProtocol {
        /**
         The user status was never changed
         */
        case empty

        /**
         The user is online

         - expires: Point in time (Unix timestamp) when the user's online status will expire
         */
        case online(expires: Int)

        /**
         The user is offline

         - wasOnline: Point in time (Unix timestamp) when the user was last online
         */
        case offline(wasOnline: Int)

        /**
         The user was online recently
         */
        case recently

        /**
         The user is offline, but was online last week
         */
        case lastWeek

        /**
         The user is offline, but was online last month
         */
        case lastMonth

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let type = try container.decode(String.self, forKey: .type)

            switch type {
            case "userStatusEmpty":
                self = .empty

            case "userStatusOnline":
                let expires = try container.decode(Int.self, forKey: .init(string: "expires"))

                self = .online(expires: expires)

            case "userStatusOffline":
                let wasOnline = try container.decode(Int.self, forKey: .init(string: "wasOnline"))

                self = .offline(wasOnline: wasOnline)

            case "userStatusRecently":
                self = .recently

            case "userStatusLastWeek":
                self = .lastWeek

            case "userStatusLastMonth":
                self = .lastMonth

            default:
                throw DecodingError.typeMismatch(UserStatus.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined UserStatus"))
            }
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            switch self {
            case .empty:
                try container.encode("userStatusEmpty", forKey: .type)

            case let .online(expires):
                try container.encode("userStatusOnline", forKey: .type)

                try container.encode(expires, forKey: .init(string: "expires"))

            case let .offline(wasOnline):
                try container.encode("userStatusOffline", forKey: .type)

                try container.encode(wasOnline, forKey: .init(string: "wasOnline"))

            case .recently:
                try container.encode("userStatusRecently", forKey: .type)

            case .lastWeek:
                try container.encode("userStatusLastWeek", forKey: .type)

            case .lastMonth:
                try container.encode("userStatusLastMonth", forKey: .type)
            }
        }
    }
}
