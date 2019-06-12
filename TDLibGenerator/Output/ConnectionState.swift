public extension TDEnum {

enum ConnectionState: TDEnumProtocol {

/// Currently waiting for the network to become available. Use SetNetworkType to change the available network type
case waitingForNetwork

/// Currently establishing a connection with a proxy server
case connectingToProxy

/// Currently establishing a connection to the Telegram servers
case connecting

/// Downloading data received while the client was offline
case updating

/// There is a working connection to the Telegram servers
case ready

// MARK: - Decodable
public init(from decoder: Decoder) throws {
let container = try decoder.container(keyedBy: AnyCodingKey.self)
let type = try container.decode(String.self, forKey: .init(string: "@type"))

switch type {
case "connectionStateWaitingForNetwork":
self = .waitingForNetwork

case "connectionStateConnectingToProxy":
self = .connectingToProxy

case "connectionStateConnecting":
self = .connecting

case "connectionStateUpdating":
self = .updating

case "connectionStateReady":
self = .ready

default:
throw DecodingError.typeMismatch(ConnectionState.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined ConnectionState"))
}
}

// MARK: - Decodable
public func encode(to encoder: Encoder) throws {
var container = encoder.container(keyedBy: AnyCodingKey.self)

switch self {
case .ready:
case .updating:
case .connecting:
case .connectingToProxy:
case .waitingForNetwork:
try container.encode("connectionStateWaitingForNetwork", forKey: .init(string: "@type"))

try container.encode("connectionStateConnectingToProxy", forKey: .init(string: "@type"))

try container.encode("connectionStateConnecting", forKey: .init(string: "@type"))

try container.encode("connectionStateUpdating", forKey: .init(string: "@type"))

try container.encode("connectionStateReady", forKey: .init(string: "@type"))

}
}

}

}