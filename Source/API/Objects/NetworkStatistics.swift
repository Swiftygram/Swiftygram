//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     A full list of available network statistic entries
     */
    struct NetworkStatistics: TDObjectProtocol {
        /**
         Point in time (Unix timestamp) when the app began collecting statistics
         */
        public var sinceDate: Foundation.Date

        /**
         Network statistics entries
         */
        public var entries: [TDEnum.NetworkStatisticsEntry]

        /**
         A full list of available network statistic entries

         - Parameter sinceDate: Point in time (Unix timestamp) when the app began collecting statistics
         - Parameter entries: Network statistics entries
         */
        public init(sinceDate: Foundation.Date, entries: [TDEnum.NetworkStatisticsEntry]) {
            self.sinceDate = sinceDate
            self.entries = entries
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            sinceDate = try container.decodeDate(forKey: .init(string: "sinceDate"))
            entries = try container.decode([TDEnum.NetworkStatisticsEntry].self, forKey: .init(string: "entries"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeDate(sinceDate, forKey: .init(string: "sinceDate"))
            try container.encode(entries, forKey: .init(string: "entries"))
        }
    }
}
