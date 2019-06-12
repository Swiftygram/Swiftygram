public extension TDEnum {

enum ChatReportReason: TDEnumProtocol {

/// The chat contains spam messages
case spam

/// The chat promotes violence
case violence

/// The chat contains pornographic messages
case pornography

/// The chat has child abuse related content
case childAbuse

/// The chat contains copyrighted content
case copyright

/// A custom reason provided by the user
/// 
/// - text: Report text
case custom(text: String)

// MARK: - Decodable
public init(from decoder: Decoder) throws {
let container = try decoder.container(keyedBy: AnyCodingKey.self)
let type = try container.decode(String.self, forKey: .init(string: "@type"))

switch type {
case "chatReportReasonSpam":
self = .spam

case "chatReportReasonViolence":
self = .violence

case "chatReportReasonPornography":
self = .pornography

case "chatReportReasonChildAbuse":
self = .childAbuse

case "chatReportReasonCopyright":
self = .copyright

case "chatReportReasonCustom":
let text = try container.decode(String.self, forKey: .init(string: "text"))

self = .custom(text: text)

default:
throw DecodingError.typeMismatch(ChatReportReason.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined ChatReportReason"))
}
}

// MARK: - Decodable
public func encode(to encoder: Encoder) throws {
var container = encoder.container(keyedBy: AnyCodingKey.self)

switch self {
case .custom(let text):
case .copyright:
case .childAbuse:
case .pornography:
case .violence:
case .spam:
try container.encode("chatReportReasonSpam", forKey: .init(string: "@type"))

try container.encode("chatReportReasonViolence", forKey: .init(string: "@type"))

try container.encode("chatReportReasonPornography", forKey: .init(string: "@type"))

try container.encode("chatReportReasonChildAbuse", forKey: .init(string: "@type"))

try container.encode("chatReportReasonCopyright", forKey: .init(string: "@type"))

try container.encode("chatReportReasonCustom", forKey: .init(string: "@type"))

try container.encode(text, forKey: .init(string: "text"))

}
}

}

}