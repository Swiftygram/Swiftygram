public extension TDEnum {

enum NotificationGroupType: TDEnumProtocol {

/// A group containing notifications of type notificationTypeNewMessage and notificationTypeNewPushMessage with ordinary unread messages
case messages

/// A group containing notifications of type notificationTypeNewMessage and notificationTypeNewPushMessage with unread mentions of the current user, replies to their messages, or a pinned message
case mentions

/// A group containing a notification of type notificationTypeNewSecretChat
case secretChat

/// A group containing notifications of type notificationTypeNewCall
case calls

// MARK: - Decodable
public init(from decoder: Decoder) throws {
let container = try decoder.container(keyedBy: AnyCodingKey.self)
let type = try container.decode(String.self, forKey: .init(string: "@type"))

switch type {
case "notificationGroupTypeMessages":
self = .messages

case "notificationGroupTypeMentions":
self = .mentions

case "notificationGroupTypeSecretChat":
self = .secretChat

case "notificationGroupTypeCalls":
self = .calls

default:
throw DecodingError.typeMismatch(NotificationGroupType.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined NotificationGroupType"))
}
}

// MARK: - Decodable
public func encode(to encoder: Encoder) throws {
var container = encoder.container(keyedBy: AnyCodingKey.self)

switch self {
case .calls:
case .secretChat:
case .mentions:
case .messages:
try container.encode("notificationGroupTypeMessages", forKey: .init(string: "@type"))

try container.encode("notificationGroupTypeMentions", forKey: .init(string: "@type"))

try container.encode("notificationGroupTypeSecretChat", forKey: .init(string: "@type"))

try container.encode("notificationGroupTypeCalls", forKey: .init(string: "@type"))

}
}

}

}