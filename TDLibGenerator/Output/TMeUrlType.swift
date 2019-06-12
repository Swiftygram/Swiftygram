public extension TDEnum {

enum TMeUrlType: TDEnumProtocol {

/// A URL linking to a user
/// 
/// - userId: Identifier of the user
case user(userId: Int)

/// A URL linking to a public supergroup or channel
/// 
/// - supergroupId: Identifier of the supergroup or channel
case supergroup(supergroupId: Int64)

/// A chat invite link
/// 
/// - info: Chat invite link info
case chatInvite(info: TDObject.ChatInviteLinkInfo)

/// A URL linking to a sticker set
/// 
/// - stickerSetId: Identifier of the sticker set
case stickerSet(stickerSetId: Int64)

// MARK: - Decodable
public init(from decoder: Decoder) throws {
let container = try decoder.container(keyedBy: AnyCodingKey.self)
let type = try container.decode(String.self, forKey: .init(string: "@type"))

switch type {
case "tMeUrlTypeUser":
let userId = try container.decode(Int.self, forKey: .init(string: "userId"))

self = .user(userId: userId)

case "tMeUrlTypeSupergroup":
let supergroupId = try container.decode(Int64.self, forKey: .init(string: "supergroupId"))

self = .supergroup(supergroupId: supergroupId)

case "tMeUrlTypeChatInvite":
let info = try container.decode(TDObject.ChatInviteLinkInfo.self, forKey: .init(string: "info"))

self = .chatInvite(info: info)

case "tMeUrlTypeStickerSet":
let stickerSetId = try container.decode(Int64.self, forKey: .init(string: "stickerSetId"))

self = .stickerSet(stickerSetId: stickerSetId)

default:
throw DecodingError.typeMismatch(TMeUrlType.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined TMeUrlType"))
}
}

// MARK: - Decodable
public func encode(to encoder: Encoder) throws {
var container = encoder.container(keyedBy: AnyCodingKey.self)

switch self {
case .stickerSet(let stickerSetId):
case .chatInvite(let info):
case .supergroup(let supergroupId):
case .user(let userId):
try container.encode("tMeUrlTypeUser", forKey: .init(string: "@type"))

try container.encode(userId, forKey: .init(string: "userId"))

try container.encode("tMeUrlTypeSupergroup", forKey: .init(string: "@type"))

try container.encode(supergroupId, forKey: .init(string: "supergroupId"))

try container.encode("tMeUrlTypeChatInvite", forKey: .init(string: "@type"))

try container.encode(info, forKey: .init(string: "info"))

try container.encode("tMeUrlTypeStickerSet", forKey: .init(string: "@type"))

try container.encode(stickerSetId, forKey: .init(string: "stickerSetId"))

}
}

}

}