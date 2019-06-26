//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDEnum {
    /**
     Contains statistics about network usage
     */
    enum NetworkStatisticsEntry: TDEnumProtocol {
        /**
         Contains information about the total amount of data that was used to send and receive files

         - fileType: Type of the file the data is part of
         - networkType: Type of the network the data was sent through. Call setNetworkType to maintain the actual network type
         - sentBytes: Total number of bytes sent
         - receivedBytes: Total number of bytes received
         */
        case file(fileType: TDEnum.FileType, networkType: TDEnum.NetworkType, sentBytes: Int64, receivedBytes: Int64)

        /**
         Contains information about the total amount of data that was used for calls

         - networkType: Type of the network the data was sent through. Call setNetworkType to maintain the actual network type
         - sentBytes: Total number of bytes sent
         - receivedBytes: Total number of bytes received
         - duration: Total call duration, in seconds
         */
        case call(networkType: TDEnum.NetworkType, sentBytes: Int64, receivedBytes: Int64, duration: Double)

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let type = try container.decode(String.self, forKey: .type)

            switch type {
            case "networkStatisticsEntryFile":
                let fileType = try container.decode(TDEnum.FileType.self, forKey: .init(string: "fileType"))
                let networkType = try container.decode(TDEnum.NetworkType.self, forKey: .init(string: "networkType"))
                let sentBytes = try container.decodeInt64(forKey: .init(string: "sentBytes"))
                let receivedBytes = try container.decodeInt64(forKey: .init(string: "receivedBytes"))

                self = .file(fileType: fileType, networkType: networkType, sentBytes: sentBytes, receivedBytes: receivedBytes)

            case "networkStatisticsEntryCall":
                let networkType = try container.decode(TDEnum.NetworkType.self, forKey: .init(string: "networkType"))
                let sentBytes = try container.decodeInt64(forKey: .init(string: "sentBytes"))
                let receivedBytes = try container.decodeInt64(forKey: .init(string: "receivedBytes"))
                let duration = try container.decode(Double.self, forKey: .init(string: "duration"))

                self = .call(networkType: networkType, sentBytes: sentBytes, receivedBytes: receivedBytes, duration: duration)

            default:
                throw DecodingError.typeMismatch(NetworkStatisticsEntry.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined NetworkStatisticsEntry"))
            }
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            switch self {
            case let .file(fileType, networkType, sentBytes, receivedBytes):
                try container.encode("networkStatisticsEntryFile", forKey: .type)

                try container.encode(fileType, forKey: .init(string: "fileType"))
                try container.encode(networkType, forKey: .init(string: "networkType"))
                try container.encodeInt64(sentBytes, forKey: .init(string: "sentBytes"))
                try container.encodeInt64(receivedBytes, forKey: .init(string: "receivedBytes"))

            case let .call(networkType, sentBytes, receivedBytes, duration):
                try container.encode("networkStatisticsEntryCall", forKey: .type)

                try container.encode(networkType, forKey: .init(string: "networkType"))
                try container.encodeInt64(sentBytes, forKey: .init(string: "sentBytes"))
                try container.encodeInt64(receivedBytes, forKey: .init(string: "receivedBytes"))
                try container.encode(duration, forKey: .init(string: "duration"))
            }
        }
    }
}
