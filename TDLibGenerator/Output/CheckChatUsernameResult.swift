public extension TDEnum {

enum CheckChatUsernameResult: TDEnumProtocol {

/// The username can be set
case ok

/// The username is invalid
case usernameInvalid

/// The username is occupied
case usernameOccupied

/// The user has too much public chats, one of them should be made private first
case publicChatsTooMuch

/// The user can't be a member of a public supergroup
case publicGroupsUnavailable

// MARK: - Decodable
public init(from decoder: Decoder) throws {
let container = try decoder.container(keyedBy: AnyCodingKey.self)
let type = try container.decode(String.self, forKey: .init(string: "@type"))

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

// MARK: - Decodable
public func encode(to encoder: Encoder) throws {
var container = encoder.container(keyedBy: AnyCodingKey.self)

switch self {
case .publicGroupsUnavailable:
case .publicChatsTooMuch:
case .usernameOccupied:
case .usernameInvalid:
case .ok:
try container.encode("checkChatUsernameResultOk", forKey: .init(string: "@type"))

try container.encode("checkChatUsernameResultUsernameInvalid", forKey: .init(string: "@type"))

try container.encode("checkChatUsernameResultUsernameOccupied", forKey: .init(string: "@type"))

try container.encode("checkChatUsernameResultPublicChatsTooMuch", forKey: .init(string: "@type"))

try container.encode("checkChatUsernameResultPublicGroupsUnavailable", forKey: .init(string: "@type"))

}
}

}

}