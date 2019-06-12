public extension TDEnum {

enum NotificationSettingsScope: TDEnumProtocol {

/// Notification settings applied to all private and secret chats when the corresponding chat setting has a default value
case privateChats

/// Notification settings applied to all basic groups and supergroups when the corresponding chat setting has a default value
case groupChats

/// Notification settings applied to all channels when the corresponding chat setting has a default value
case channelChats

// MARK: - Decodable
public init(from decoder: Decoder) throws {
let container = try decoder.container(keyedBy: AnyCodingKey.self)
let type = try container.decode(String.self, forKey: .init(string: "@type"))

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
case .channelChats:
case .groupChats:
case .privateChats:
try container.encode("notificationSettingsScopePrivateChats", forKey: .init(string: "@type"))

try container.encode("notificationSettingsScopeGroupChats", forKey: .init(string: "@type"))

try container.encode("notificationSettingsScopeChannelChats", forKey: .init(string: "@type"))

}
}

}

}