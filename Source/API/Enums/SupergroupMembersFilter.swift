//
//  SupergroupMembersFilter.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDEnum {
    /**
     Specifies the kind of chat members to return in getSupergroupMembers
     */
    enum SupergroupMembersFilter: TDEnumProtocol {
        /**
         Returns recently active users in reverse chronological order
         */
        case recent

        /**
         Returns the creator and administrators
         */
        case administrators

        /**
         Used to search for supergroup or channel members via a (string) query

         - query: Query to search for
         */
        case search(query: String)

        /**
         Returns restricted supergroup members; can be used only by administrators

         - query: Query to search for
         */
        case restricted(query: String)

        /**
         Returns users banned from the supergroup or channel; can be used only by administrators

         - query: Query to search for
         */
        case banned(query: String)

        /**
         Returns bot members of the supergroup or channel
         */
        case bots

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let type = try container.decode(String.self, forKey: .type)

            switch type {
            case "supergroupMembersFilterRecent":
                self = .recent

            case "supergroupMembersFilterAdministrators":
                self = .administrators

            case "supergroupMembersFilterSearch":
                let query = try container.decode(String.self, forKey: .init(string: "query"))

                self = .search(query: query)

            case "supergroupMembersFilterRestricted":
                let query = try container.decode(String.self, forKey: .init(string: "query"))

                self = .restricted(query: query)

            case "supergroupMembersFilterBanned":
                let query = try container.decode(String.self, forKey: .init(string: "query"))

                self = .banned(query: query)

            case "supergroupMembersFilterBots":
                self = .bots

            default:
                throw DecodingError.typeMismatch(SupergroupMembersFilter.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined SupergroupMembersFilter"))
            }
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            switch self {
            case .recent:
                try container.encode("supergroupMembersFilterRecent", forKey: .type)

            case .administrators:
                try container.encode("supergroupMembersFilterAdministrators", forKey: .type)

            case let .search(query):
                try container.encode("supergroupMembersFilterSearch", forKey: .type)

                try container.encode(query, forKey: .init(string: "query"))

            case let .restricted(query):
                try container.encode("supergroupMembersFilterRestricted", forKey: .type)

                try container.encode(query, forKey: .init(string: "query"))

            case let .banned(query):
                try container.encode("supergroupMembersFilterBanned", forKey: .type)

                try container.encode(query, forKey: .init(string: "query"))

            case .bots:
                try container.encode("supergroupMembersFilterBots", forKey: .type)
            }
        }
    }
}
