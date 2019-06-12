public extension TDEnum {

enum KeyboardButtonType: TDEnumProtocol {

/// A simple button, with text that should be sent when the button is pressed
case text

/// A button that sends the user's phone number when pressed; available only in private chats
case requestPhoneNumber

/// A button that sends the user's location when pressed; available only in private chats
case requestLocation

// MARK: - Decodable
public init(from decoder: Decoder) throws {
let container = try decoder.container(keyedBy: AnyCodingKey.self)
let type = try container.decode(String.self, forKey: .init(string: "@type"))

switch type {
case "keyboardButtonTypeText":
self = .text

case "keyboardButtonTypeRequestPhoneNumber":
self = .requestPhoneNumber

case "keyboardButtonTypeRequestLocation":
self = .requestLocation

default:
throw DecodingError.typeMismatch(KeyboardButtonType.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined KeyboardButtonType"))
}
}

// MARK: - Decodable
public func encode(to encoder: Encoder) throws {
var container = encoder.container(keyedBy: AnyCodingKey.self)

switch self {
case .requestLocation:
case .requestPhoneNumber:
case .text:
try container.encode("keyboardButtonTypeText", forKey: .init(string: "@type"))

try container.encode("keyboardButtonTypeRequestPhoneNumber", forKey: .init(string: "@type"))

try container.encode("keyboardButtonTypeRequestLocation", forKey: .init(string: "@type"))

}
}

}

}