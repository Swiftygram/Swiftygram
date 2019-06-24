//
//  NetworkType.swift
//  Swiftygram
//  Created by ky1vstar on 6/24/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDEnum {
    enum NetworkType: TDEnumProtocol {
        ///  The network is not available
        case none

        ///  A mobile network
        case mobile

        ///  A mobile roaming network
        case mobileRoaming

        ///  A Wi-Fi network
        case wiFi

        ///  A different network type (e.g., Ethernet network)
        case other

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let type = try container.decode(String.self, forKey: .type)

            switch type {
            case "networkTypeNone":
                self = .none

            case "networkTypeMobile":
                self = .mobile

            case "networkTypeMobileRoaming":
                self = .mobileRoaming

            case "networkTypeWiFi":
                self = .wiFi

            case "networkTypeOther":
                self = .other

            default:
                throw DecodingError.typeMismatch(NetworkType.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined NetworkType"))
            }
        }

        // MARK: - Decodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            switch self {
            case .none:
                try container.encode("networkTypeNone", forKey: .type)

            case .mobile:
                try container.encode("networkTypeMobile", forKey: .type)

            case .mobileRoaming:
                try container.encode("networkTypeMobileRoaming", forKey: .type)

            case .wiFi:
                try container.encode("networkTypeWiFi", forKey: .type)

            case .other:
                try container.encode("networkTypeOther", forKey: .type)
            }
        }
    }
}
