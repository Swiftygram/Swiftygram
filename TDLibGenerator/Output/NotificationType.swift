public extension TDEnum {

enum NotificationType: TDEnumProtocol {

/// New message was received
/// 
/// - message: The message
case newMessage(message: TDObject.Message)

/// New secret chat was created
case newSecretChat

/// New call was received
/// 
/// - callId: Call identifier
case newCall(callId: Int)

/// New message was received through a push notification
/// 
/// - messageId: The message identifier. The message will not be available in the chat history, but the ID can be used in viewMessages and as reply_to_message_id
/// - senderUserId: Sender of the message. Corresponding user may be inaccessible
/// - content: Push message content
case newPushMessage(messageId: Int64, senderUserId: Int, content: TDEnum.PushMessageContent)

// MARK: - Decodable
public init(from decoder: Decoder) throws {
let container = try decoder.container(keyedBy: AnyCodingKey.self)
let type = try container.decode(String.self, forKey: .init(string: "@type"))

switch type {
case "notificationTypeNewMessage":
let message = try container.decode(TDObject.Message.self, forKey: .init(string: "message"))

self = .newMessage(message: message)

case "notificationTypeNewSecretChat":
self = .newSecretChat

case "notificationTypeNewCall":
let callId = try container.decode(Int.self, forKey: .init(string: "callId"))

self = .newCall(callId: callId)

case "notificationTypeNewPushMessage":
let messageId = try container.decode(Int64.self, forKey: .init(string: "messageId"))
let senderUserId = try container.decode(Int.self, forKey: .init(string: "senderUserId"))
let content = try container.decode(TDEnum.PushMessageContent.self, forKey: .init(string: "content"))

self = .newPushMessage(messageId: messageId, senderUserId: senderUserId, content: content)

default:
throw DecodingError.typeMismatch(NotificationType.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined NotificationType"))
}
}

// MARK: - Decodable
public func encode(to encoder: Encoder) throws {
var container = encoder.container(keyedBy: AnyCodingKey.self)

switch self {
case .newPushMessage(let messageId, let senderUserId, let content):
case .newCall(let callId):
case .newSecretChat:
case .newMessage(let message):
try container.encode("notificationTypeNewMessage", forKey: .init(string: "@type"))

try container.encode(message, forKey: .init(string: "message"))

try container.encode("notificationTypeNewSecretChat", forKey: .init(string: "@type"))

try container.encode("notificationTypeNewCall", forKey: .init(string: "@type"))

try container.encode(callId, forKey: .init(string: "callId"))

try container.encode("notificationTypeNewPushMessage", forKey: .init(string: "@type"))

try container.encode(messageId, forKey: .init(string: "messageId"))
try container.encode(senderUserId, forKey: .init(string: "senderUserId"))
try container.encode(content, forKey: .init(string: "content"))

}
}

}

}