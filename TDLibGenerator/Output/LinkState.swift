public extension TDEnum {

enum LinkState: TDEnumProtocol {

/// The phone number of user A is not known to user B
case none

/// The phone number of user A is known but that number has not been saved to the contact list of user B
case knowsPhoneNumber

/// The phone number of user A has been saved to the contact list of user B
case isContact

// MARK: - Decodable
public init(from decoder: Decoder) throws {
let container = try decoder.container(keyedBy: AnyCodingKey.self)
let type = try container.decode(String.self, forKey: .init(string: "@type"))

switch type {
case "linkStateNone":
self = .none

case "linkStateKnowsPhoneNumber":
self = .knowsPhoneNumber

case "linkStateIsContact":
self = .isContact

default:
throw DecodingError.typeMismatch(LinkState.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined LinkState"))
}
}

// MARK: - Decodable
public func encode(to encoder: Encoder) throws {
var container = encoder.container(keyedBy: AnyCodingKey.self)

switch self {
case .isContact:
case .knowsPhoneNumber:
case .none:
try container.encode("linkStateNone", forKey: .init(string: "@type"))

try container.encode("linkStateKnowsPhoneNumber", forKey: .init(string: "@type"))

try container.encode("linkStateIsContact", forKey: .init(string: "@type"))

}
}

}

}