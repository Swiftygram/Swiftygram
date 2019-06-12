public extension TDEnum {

enum TextEntityType: TDEnumProtocol {

/// A mention of a user by their username
case mention

/// A hashtag text, beginning with "#"
case hashtag

/// A cashtag text, beginning with "$" and consisting of capital english letters (i.e. "$USD")
case cashtag

/// A bot command, beginning with "/". This shouldn't be highlighted if there are no bots in the chat
case botCommand

/// An HTTP URL
case url

/// An email address
case emailAddress

/// A bold text
case bold

/// An italic text
case italic

/// Text that must be formatted as if inside a code HTML tag
case code

/// Text that must be formatted as if inside a pre HTML tag
case pre

/// Text that must be formatted as if inside pre, and code HTML tags
/// 
/// - language: Programming language of the code; as defined by the sender
case preCode(language: String)

/// A text description shown instead of a raw URL
/// 
/// - url: HTTP or tg:// URL to be opened when the link is clicked
case textUrl(url: String)

/// A text shows instead of a raw mention of the user (e.g., when the user has no username)
/// 
/// - userId: Identifier of the mentioned user
case mentionName(userId: Int)

/// A phone number
case phoneNumber

// MARK: - Decodable
public init(from decoder: Decoder) throws {
let container = try decoder.container(keyedBy: AnyCodingKey.self)
let type = try container.decode(String.self, forKey: .init(string: "@type"))

switch type {
case "textEntityTypeMention":
self = .mention

case "textEntityTypeHashtag":
self = .hashtag

case "textEntityTypeCashtag":
self = .cashtag

case "textEntityTypeBotCommand":
self = .botCommand

case "textEntityTypeUrl":
self = .url

case "textEntityTypeEmailAddress":
self = .emailAddress

case "textEntityTypeBold":
self = .bold

case "textEntityTypeItalic":
self = .italic

case "textEntityTypeCode":
self = .code

case "textEntityTypePre":
self = .pre

case "textEntityTypePreCode":
let language = try container.decode(String.self, forKey: .init(string: "language"))

self = .preCode(language: language)

case "textEntityTypeTextUrl":
let url = try container.decode(String.self, forKey: .init(string: "url"))

self = .textUrl(url: url)

case "textEntityTypeMentionName":
let userId = try container.decode(Int.self, forKey: .init(string: "userId"))

self = .mentionName(userId: userId)

case "textEntityTypePhoneNumber":
self = .phoneNumber

default:
throw DecodingError.typeMismatch(TextEntityType.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined TextEntityType"))
}
}

// MARK: - Decodable
public func encode(to encoder: Encoder) throws {
var container = encoder.container(keyedBy: AnyCodingKey.self)

switch self {
case .phoneNumber:
case .mentionName(let userId):
case .textUrl(let url):
case .preCode(let language):
case .pre:
case .code:
case .italic:
case .bold:
case .emailAddress:
case .url:
case .botCommand:
case .cashtag:
case .hashtag:
case .mention:
try container.encode("textEntityTypeMention", forKey: .init(string: "@type"))

try container.encode("textEntityTypeHashtag", forKey: .init(string: "@type"))

try container.encode("textEntityTypeCashtag", forKey: .init(string: "@type"))

try container.encode("textEntityTypeBotCommand", forKey: .init(string: "@type"))

try container.encode("textEntityTypeUrl", forKey: .init(string: "@type"))

try container.encode("textEntityTypeEmailAddress", forKey: .init(string: "@type"))

try container.encode("textEntityTypeBold", forKey: .init(string: "@type"))

try container.encode("textEntityTypeItalic", forKey: .init(string: "@type"))

try container.encode("textEntityTypeCode", forKey: .init(string: "@type"))

try container.encode("textEntityTypePre", forKey: .init(string: "@type"))

try container.encode("textEntityTypePreCode", forKey: .init(string: "@type"))

try container.encode(language, forKey: .init(string: "language"))

try container.encode("textEntityTypeTextUrl", forKey: .init(string: "@type"))

try container.encode(url, forKey: .init(string: "url"))

try container.encode("textEntityTypeMentionName", forKey: .init(string: "@type"))

try container.encode(userId, forKey: .init(string: "userId"))

try container.encode("textEntityTypePhoneNumber", forKey: .init(string: "@type"))

}
}

}

}