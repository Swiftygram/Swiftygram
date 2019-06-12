public extension TDEnum {

enum ChatMembersFilter: TDEnumProtocol {

/// Returns the creator and administrators
case administrators

/// Returns all chat members, including restricted chat members
case members

/// Returns users under certain restrictions in the chat; can be used only by administrators in a supergroup
case restricted

/// Returns users banned from the chat; can be used only by administrators in a supergroup or in a channel
case banned

/// Returns bot members of the chat
case bots

// MARK: - Decodable
public init(from decoder: Decoder) throws {
let container = try decoder.container(keyedBy: AnyCodingKey.self)
let type = try container.decode(String.self, forKey: .init(string: "@type"))

switch type {
case "chatMembersFilterAdministrators":
self = .administrators

case "chatMembersFilterMembers":
self = .members

case "chatMembersFilterRestricted":
self = .restricted

case "chatMembersFilterBanned":
self = .banned

case "chatMembersFilterBots":
self = .bots

default:
throw DecodingError.typeMismatch(ChatMembersFilter.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined ChatMembersFilter"))
}
}

// MARK: - Decodable
public func encode(to encoder: Encoder) throws {
var container = encoder.container(keyedBy: AnyCodingKey.self)

switch self {
case .bots:
case .banned:
case .restricted:
case .members:
case .administrators:
try container.encode("chatMembersFilterAdministrators", forKey: .init(string: "@type"))

try container.encode("chatMembersFilterMembers", forKey: .init(string: "@type"))

try container.encode("chatMembersFilterRestricted", forKey: .init(string: "@type"))

try container.encode("chatMembersFilterBanned", forKey: .init(string: "@type"))

try container.encode("chatMembersFilterBots", forKey: .init(string: "@type"))

}
}

}

}