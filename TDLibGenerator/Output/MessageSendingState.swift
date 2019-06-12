public extension TDEnum {

enum MessageSendingState: TDEnumProtocol {

/// The message is being sent now, but has not yet been delivered to the server
case pending

/// The message failed to be sent
case failed

// MARK: - Decodable
public init(from decoder: Decoder) throws {
let container = try decoder.container(keyedBy: AnyCodingKey.self)
let type = try container.decode(String.self, forKey: .init(string: "@type"))

switch type {
case "messageSendingStatePending":
self = .pending

case "messageSendingStateFailed":
self = .failed

default:
throw DecodingError.typeMismatch(MessageSendingState.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined MessageSendingState"))
}
}

// MARK: - Decodable
public func encode(to encoder: Encoder) throws {
var container = encoder.container(keyedBy: AnyCodingKey.self)

switch self {
case .failed:
case .pending:
try container.encode("messageSendingStatePending", forKey: .init(string: "@type"))

try container.encode("messageSendingStateFailed", forKey: .init(string: "@type"))

}
}

}

}