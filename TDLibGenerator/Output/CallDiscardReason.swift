public extension TDEnum {

enum CallDiscardReason: TDEnumProtocol {

/// The call wasn't discarded, or the reason is unknown
case empty

/// The call was ended before the conversation started. It was cancelled by the caller or missed by the other party
case missed

/// The call was ended before the conversation started. It was declined by the other party
case declined

/// The call was ended during the conversation because the users were disconnected
case disconnected

/// The call was ended because one of the parties hung up
case hungUp

// MARK: - Decodable
public init(from decoder: Decoder) throws {
let container = try decoder.container(keyedBy: AnyCodingKey.self)
let type = try container.decode(String.self, forKey: .init(string: "@type"))

switch type {
case "callDiscardReasonEmpty":
self = .empty

case "callDiscardReasonMissed":
self = .missed

case "callDiscardReasonDeclined":
self = .declined

case "callDiscardReasonDisconnected":
self = .disconnected

case "callDiscardReasonHungUp":
self = .hungUp

default:
throw DecodingError.typeMismatch(CallDiscardReason.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined CallDiscardReason"))
}
}

// MARK: - Decodable
public func encode(to encoder: Encoder) throws {
var container = encoder.container(keyedBy: AnyCodingKey.self)

switch self {
case .hungUp:
case .disconnected:
case .declined:
case .missed:
case .empty:
try container.encode("callDiscardReasonEmpty", forKey: .init(string: "@type"))

try container.encode("callDiscardReasonMissed", forKey: .init(string: "@type"))

try container.encode("callDiscardReasonDeclined", forKey: .init(string: "@type"))

try container.encode("callDiscardReasonDisconnected", forKey: .init(string: "@type"))

try container.encode("callDiscardReasonHungUp", forKey: .init(string: "@type"))

}
}

}

}