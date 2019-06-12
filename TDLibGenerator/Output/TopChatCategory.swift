public extension TDEnum {

enum TopChatCategory: TDEnumProtocol {

/// A category containing frequently used private chats with non-bot users
case users

/// A category containing frequently used private chats with bot users
case bots

/// A category containing frequently used basic groups and supergroups
case groups

/// A category containing frequently used channels
case channels

/// A category containing frequently used chats with inline bots sorted by their usage in inline mode
case inlineBots

/// A category containing frequently used chats used for calls
case calls

// MARK: - Decodable
public init(from decoder: Decoder) throws {
let container = try decoder.container(keyedBy: AnyCodingKey.self)
let type = try container.decode(String.self, forKey: .init(string: "@type"))

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

// MARK: - Decodable
public func encode(to encoder: Encoder) throws {
var container = encoder.container(keyedBy: AnyCodingKey.self)

switch self {
case .calls:
case .inlineBots:
case .channels:
case .groups:
case .bots:
case .users:
try container.encode("topChatCategoryUsers", forKey: .init(string: "@type"))

try container.encode("topChatCategoryBots", forKey: .init(string: "@type"))

try container.encode("topChatCategoryGroups", forKey: .init(string: "@type"))

try container.encode("topChatCategoryChannels", forKey: .init(string: "@type"))

try container.encode("topChatCategoryInlineBots", forKey: .init(string: "@type"))

try container.encode("topChatCategoryCalls", forKey: .init(string: "@type"))

}
}

}

}