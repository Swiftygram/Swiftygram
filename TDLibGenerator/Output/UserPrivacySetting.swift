public extension TDEnum {

enum UserPrivacySetting: TDEnumProtocol {

/// A privacy setting for managing whether the user's online status is visible
case showStatus

/// A privacy setting for managing whether the user can be invited to chats
case allowChatInvites

/// A privacy setting for managing whether the user can be called
case allowCalls

/// A privacy setting for managing whether peer-to-peer connections can be used for calls
case allowPeerToPeerCalls

// MARK: - Decodable
public init(from decoder: Decoder) throws {
let container = try decoder.container(keyedBy: AnyCodingKey.self)
let type = try container.decode(String.self, forKey: .init(string: "@type"))

switch type {
case "userPrivacySettingShowStatus":
self = .showStatus

case "userPrivacySettingAllowChatInvites":
self = .allowChatInvites

case "userPrivacySettingAllowCalls":
self = .allowCalls

case "userPrivacySettingAllowPeerToPeerCalls":
self = .allowPeerToPeerCalls

default:
throw DecodingError.typeMismatch(UserPrivacySetting.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined UserPrivacySetting"))
}
}

// MARK: - Decodable
public func encode(to encoder: Encoder) throws {
var container = encoder.container(keyedBy: AnyCodingKey.self)

switch self {
case .allowPeerToPeerCalls:
case .allowCalls:
case .allowChatInvites:
case .showStatus:
try container.encode("userPrivacySettingShowStatus", forKey: .init(string: "@type"))

try container.encode("userPrivacySettingAllowChatInvites", forKey: .init(string: "@type"))

try container.encode("userPrivacySettingAllowCalls", forKey: .init(string: "@type"))

try container.encode("userPrivacySettingAllowPeerToPeerCalls", forKey: .init(string: "@type"))

}
}

}

}