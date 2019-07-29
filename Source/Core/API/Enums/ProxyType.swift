//
//  ProxyType.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDEnum {
    /**
     Describes the type of the proxy server
     */
    enum ProxyType: TDEnumProtocol {
        /**
         A SOCKS5 proxy server

         - username: Username for logging in; may be empty
         - password: Password for logging in; may be empty
         */
        case socks5(username: String, password: String)

        /**
         A HTTP transparent proxy server

         - username: Username for logging in; may be empty
         - password: Password for logging in; may be empty
         - httpOnly: Pass true, if the proxy supports only HTTP requests and doesn't support transparent TCP connections via HTTP CONNECT method
         */
        case http(username: String, password: String, httpOnly: Bool)

        /**
         An MTProto proxy server

         - secret: The proxy's secret in hexadecimal encoding
         */
        case mtproto(secret: String)

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let type = try container.decode(String.self, forKey: .type)

            switch type {
            case "proxyTypeSocks5":
                let username = try container.decode(String.self, forKey: .init(string: "username"))
                let password = try container.decode(String.self, forKey: .init(string: "password"))

                self = .socks5(username: username, password: password)

            case "proxyTypeHttp":
                let username = try container.decode(String.self, forKey: .init(string: "username"))
                let password = try container.decode(String.self, forKey: .init(string: "password"))
                let httpOnly = try container.decode(Bool.self, forKey: .init(string: "httpOnly"))

                self = .http(username: username, password: password, httpOnly: httpOnly)

            case "proxyTypeMtproto":
                let secret = try container.decode(String.self, forKey: .init(string: "secret"))

                self = .mtproto(secret: secret)

            default:
                throw DecodingError.typeMismatch(ProxyType.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined ProxyType"))
            }
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            switch self {
            case let .socks5(username, password):
                try container.encode("proxyTypeSocks5", forKey: .type)

                try container.encode(username, forKey: .init(string: "username"))
                try container.encode(password, forKey: .init(string: "password"))

            case let .http(username, password, httpOnly):
                try container.encode("proxyTypeHttp", forKey: .type)

                try container.encode(username, forKey: .init(string: "username"))
                try container.encode(password, forKey: .init(string: "password"))
                try container.encode(httpOnly, forKey: .init(string: "httpOnly"))

            case let .mtproto(secret):
                try container.encode("proxyTypeMtproto", forKey: .type)

                try container.encode(secret, forKey: .init(string: "secret"))
            }
        }

        public var isSocks5: Bool {
            if case .socks5 = self {
                return true
            } else {
                return false
            }
        }

        public var isHttp: Bool {
            if case .http = self {
                return true
            } else {
                return false
            }
        }

        public var isMtproto: Bool {
            if case .mtproto = self {
                return true
            } else {
                return false
            }
        }
    }
}
