//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Describes the address of UDP reflectors
     */
    struct CallConnection: TDObjectProtocol {
        /**
         Reflector identifier
         */
        public var id: Int64

        /**
         IPv4 reflector address
         */
        public var ip: String

        /**
         IPv6 reflector address
         */
        public var ipv6: String

        /**
         Reflector port number
         */
        public var port: Int

        /**
         Connection peer tag
         */
        public var peerTag: String

        /**
         Describes the address of UDP reflectors

         - Parameter id: Reflector identifier
         - Parameter ip: IPv4 reflector address
         - Parameter ipv6: IPv6 reflector address
         - Parameter port: Reflector port number
         - Parameter peerTag: Connection peer tag
         */
        public init(id: Int64, ip: String, ipv6: String, port: Int, peerTag: String) {
            self.id = id
            self.ip = ip
            self.ipv6 = ipv6
            self.port = port
            self.peerTag = peerTag
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            id = try container.decodeInt64(forKey: .init(string: "id"))
            ip = try container.decode(String.self, forKey: .init(string: "ip"))
            ipv6 = try container.decode(String.self, forKey: .init(string: "ipv6"))
            port = try container.decode(Int.self, forKey: .init(string: "port"))
            peerTag = try container.decode(String.self, forKey: .init(string: "peerTag"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(id, forKey: .init(string: "id"))
            try container.encode(ip, forKey: .init(string: "ip"))
            try container.encode(ipv6, forKey: .init(string: "ipv6"))
            try container.encode(port, forKey: .init(string: "port"))
            try container.encode(peerTag, forKey: .init(string: "peerTag"))
        }
    }
}
