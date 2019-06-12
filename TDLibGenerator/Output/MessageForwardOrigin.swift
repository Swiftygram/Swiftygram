public extension TDEnum {

enum MessageForwardOrigin: TDEnumProtocol {

/// The message was originally written by a known user
/// 
/// - senderUserId: Identifier of the user that originally sent the message
case user(senderUserId: Int)

/// The message was originally written by a user, which is hidden by his privacy settings
/// 
/// - senderName: Name of the sender
case hiddenUser(senderName: String)

/// The message was originally a post in a channel
/// 
/// - chatId: Identifier of the chat from which the message was originally forwarded
/// - messageId: Message identifier of the original message; 0 if unknown
/// - authorSignature: Original post author signature
case channel(chatId: Int64, messageId: Int64, authorSignature: String)

// MARK: - Decodable
public init(from decoder: Decoder) throws {
let container = try decoder.container(keyedBy: AnyCodingKey.self)
let type = try container.decode(String.self, forKey: .init(string: "@type"))

switch type {
case "messageForwardOriginUser":
let senderUserId = try container.decode(Int.self, forKey: .init(string: "senderUserId"))

self = .user(senderUserId: senderUserId)

case "messageForwardOriginHiddenUser":
let senderName = try container.decode(String.self, forKey: .init(string: "senderName"))

self = .hiddenUser(senderName: senderName)

case "messageForwardOriginChannel":
let chatId = try container.decode(Int64.self, forKey: .init(string: "chatId"))
let messageId = try container.decode(Int64.self, forKey: .init(string: "messageId"))
let authorSignature = try container.decode(String.self, forKey: .init(string: "authorSignature"))

self = .channel(chatId: chatId, messageId: messageId, authorSignature: authorSignature)

default:
throw DecodingError.typeMismatch(MessageForwardOrigin.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined MessageForwardOrigin"))
}
}

// MARK: - Decodable
public func encode(to encoder: Encoder) throws {
var container = encoder.container(keyedBy: AnyCodingKey.self)

switch self {
case .channel(let chatId, let messageId, let authorSignature):
case .hiddenUser(let senderName):
case .user(let senderUserId):
try container.encode("messageForwardOriginUser", forKey: .init(string: "@type"))

try container.encode(senderUserId, forKey: .init(string: "senderUserId"))

try container.encode("messageForwardOriginHiddenUser", forKey: .init(string: "@type"))

try container.encode(senderName, forKey: .init(string: "senderName"))

try container.encode("messageForwardOriginChannel", forKey: .init(string: "@type"))

try container.encode(chatId, forKey: .init(string: "chatId"))
try container.encode(messageId, forKey: .init(string: "messageId"))
try container.encode(authorSignature, forKey: .init(string: "authorSignature"))

}
}

}

}