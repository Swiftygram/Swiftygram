//
//  Proxy.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains information about a proxy server
     */
    struct Proxy: TDObjectProtocol {
        /**
         Unique identifier of the proxy
         */
        public var id: Int

        /**
         Proxy server IP address
         */
        public var server: String

        /**
         Proxy server port
         */
        public var port: Int

        /**
         Point in time (Unix timestamp) when the proxy was last used; 0 if never
         */
        public var lastUsedDate: Foundation.Date

        /**
         True, if the proxy is enabled now
         */
        public var isEnabled: Bool

        /**
         Type of the proxy
         */
        public var type: TDEnum.ProxyType

        /**
         Contains information about a proxy server

         - Parameter id: Unique identifier of the proxy
         - Parameter server: Proxy server IP address
         - Parameter port: Proxy server port
         - Parameter lastUsedDate: Point in time (Unix timestamp) when the proxy was last used; 0 if never
         - Parameter isEnabled: True, if the proxy is enabled now
         - Parameter type: Type of the proxy
         */
        public init(id: Int, server: String, port: Int, lastUsedDate: Foundation.Date, isEnabled: Bool, type: TDEnum.ProxyType) {
            self.id = id
            self.server = server
            self.port = port
            self.lastUsedDate = lastUsedDate
            self.isEnabled = isEnabled
            self.type = type
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            id = try container.decode(Int.self, forKey: .init(string: "id"))
            server = try container.decode(String.self, forKey: .init(string: "server"))
            port = try container.decode(Int.self, forKey: .init(string: "port"))
            lastUsedDate = try container.decodeDate(forKey: .init(string: "lastUsedDate"))
            isEnabled = try container.decode(Bool.self, forKey: .init(string: "isEnabled"))
            type = try container.decode(TDEnum.ProxyType.self, forKey: .init(string: "type"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encode(id, forKey: .init(string: "id"))
            try container.encode(server, forKey: .init(string: "server"))
            try container.encode(port, forKey: .init(string: "port"))
            try container.encodeDate(lastUsedDate, forKey: .init(string: "lastUsedDate"))
            try container.encode(isEnabled, forKey: .init(string: "isEnabled"))
            try container.encode(type, forKey: .init(string: "type"))
        }
    }
}
