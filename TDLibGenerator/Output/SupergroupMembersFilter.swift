public extension TDEnum {

enum SupergroupMembersFilter: TDEnumProtocol {

/// Returns recently active users in reverse chronological order
case recent

/// Returns the creator and administrators
case administrators

/// Used to search for supergroup or channel members via a (string) query
/// 
/// - query: Query to search for
case search(query: String)

/// Returns restricted supergroup members; can be used only by administrators
/// 
/// - query: Query to search for
case restricted(query: String)

/// Returns users banned from the supergroup or channel; can be used only by administrators
/// 
/// - query: Query to search for
case banned(query: String)

/// Returns bot members of the supergroup or channel
case bots

// MARK: - Decodable
public init(from decoder: Decoder) throws {
let container = try decoder.container(keyedBy: AnyCodingKey.self)
let type = try container.decode(String.self, forKey: .init(string: "@type"))

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

// MARK: - Decodable
public func encode(to encoder: Encoder) throws {
var container = encoder.container(keyedBy: AnyCodingKey.self)

switch self {
case .bots:
case .banned(let query):
case .restricted(let query):
case .search(let query):
case .administrators:
case .recent:
try container.encode("supergroupMembersFilterRecent", forKey: .init(string: "@type"))

try container.encode("supergroupMembersFilterAdministrators", forKey: .init(string: "@type"))

try container.encode("supergroupMembersFilterSearch", forKey: .init(string: "@type"))

try container.encode(query, forKey: .init(string: "query"))

try container.encode("supergroupMembersFilterRestricted", forKey: .init(string: "@type"))

try container.encode(query, forKey: .init(string: "query"))

try container.encode("supergroupMembersFilterBanned", forKey: .init(string: "@type"))

try container.encode(query, forKey: .init(string: "query"))

try container.encode("supergroupMembersFilterBots", forKey: .init(string: "@type"))

}
}

}

}