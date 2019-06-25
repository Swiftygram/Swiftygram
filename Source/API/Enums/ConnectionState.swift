//
//  ConnectionState.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDEnum {
    /**
     Describes the current state of the connection to Telegram servers
     */
    enum ConnectionState: TDEnumProtocol {
        /**
         Currently waiting for the network to become available. Use SetNetworkType to change the available network type
         */
        case waitingForNetwork

        /**
         Currently establishing a connection with a proxy server
         */
        case connectingToProxy

        /**
         Currently establishing a connection to the Telegram servers
         */
        case connecting

        /**
         Downloading data received while the client was offline
         */
        case updating

        /**
         There is a working connection to the Telegram servers
         */
        case ready

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let type = try container.decode(String.self, forKey: .type)

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

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            switch self {
            case .waitingForNetwork:
                try container.encode("connectionStateWaitingForNetwork", forKey: .type)

            case .connectingToProxy:
                try container.encode("connectionStateConnectingToProxy", forKey: .type)

            case .connecting:
                try container.encode("connectionStateConnecting", forKey: .type)

            case .updating:
                try container.encode("connectionStateUpdating", forKey: .type)

            case .ready:
                try container.encode("connectionStateReady", forKey: .type)
            }
        }
    }
}
