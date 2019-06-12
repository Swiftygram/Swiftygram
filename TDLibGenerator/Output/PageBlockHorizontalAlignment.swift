public extension TDEnum {

enum PageBlockHorizontalAlignment: TDEnumProtocol {

/// The content should be left-aligned
case left

/// The content should be center-aligned
case center

/// The content should be right-aligned
case right

// MARK: - Decodable
public init(from decoder: Decoder) throws {
let container = try decoder.container(keyedBy: AnyCodingKey.self)
let type = try container.decode(String.self, forKey: .init(string: "@type"))

switch type {
case "pageBlockHorizontalAlignmentLeft":
self = .left

case "pageBlockHorizontalAlignmentCenter":
self = .center

case "pageBlockHorizontalAlignmentRight":
self = .right

default:
throw DecodingError.typeMismatch(PageBlockHorizontalAlignment.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined PageBlockHorizontalAlignment"))
}
}

// MARK: - Decodable
public func encode(to encoder: Encoder) throws {
var container = encoder.container(keyedBy: AnyCodingKey.self)

switch self {
case .right:
case .center:
case .left:
try container.encode("pageBlockHorizontalAlignmentLeft", forKey: .init(string: "@type"))

try container.encode("pageBlockHorizontalAlignmentCenter", forKey: .init(string: "@type"))

try container.encode("pageBlockHorizontalAlignmentRight", forKey: .init(string: "@type"))

}
}

}

}