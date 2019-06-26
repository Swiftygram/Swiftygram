//
//  ConnectedWebsite.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains information about one website the current user is logged in with Telegram
     */
    struct ConnectedWebsite: TDObjectProtocol {
        /**
         Website identifier
         */
        public let id: Int64

        /**
         The domain name of the website
         */
        public let domainName: String

        /**
         User identifier of a bot linked with the website
         */
        public let botUserId: Int

        /**
         The version of a browser used to log in
         */
        public let browser: String

        /**
         Operating system the browser is running on
         */
        public let platform: String

        /**
         Point in time (Unix timestamp) when the user was logged in
         */
        public let logInDate: Foundation.Date

        /**
         Point in time (Unix timestamp) when obtained authorization was last used
         */
        public let lastActiveDate: Foundation.Date

        /**
         IP address from which the user was logged in, in human-readable format
         */
        public let ip: String

        /**
         Human-readable description of a country and a region, from which the user was logged in, based on the IP address
         */
        public let location: String

        /**
         Contains information about one website the current user is logged in with Telegram

         - Parameter id: Website identifier
         - Parameter domainName: The domain name of the website
         - Parameter botUserId: User identifier of a bot linked with the website
         - Parameter browser: The version of a browser used to log in
         - Parameter platform: Operating system the browser is running on
         - Parameter logInDate: Point in time (Unix timestamp) when the user was logged in
         - Parameter lastActiveDate: Point in time (Unix timestamp) when obtained authorization was last used
         - Parameter ip: IP address from which the user was logged in, in human-readable format
         - Parameter location: Human-readable description of a country and a region, from which the user was logged in, based on the IP address
         */
        public init(id: Int64, domainName: String, botUserId: Int, browser: String, platform: String, logInDate: Foundation.Date, lastActiveDate: Foundation.Date, ip: String, location: String) {
            self.id = id
            self.domainName = domainName
            self.botUserId = botUserId
            self.browser = browser
            self.platform = platform
            self.logInDate = logInDate
            self.lastActiveDate = lastActiveDate
            self.ip = ip
            self.location = location
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            id = try container.decodeInt64(forKey: .init(string: "id"))
            domainName = try container.decode(String.self, forKey: .init(string: "domainName"))
            botUserId = try container.decode(Int.self, forKey: .init(string: "botUserId"))
            browser = try container.decode(String.self, forKey: .init(string: "browser"))
            platform = try container.decode(String.self, forKey: .init(string: "platform"))
            logInDate = try container.decodeDate(forKey: .init(string: "logInDate"))
            lastActiveDate = try container.decodeDate(forKey: .init(string: "lastActiveDate"))
            ip = try container.decode(String.self, forKey: .init(string: "ip"))
            location = try container.decode(String.self, forKey: .init(string: "location"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(id, forKey: .init(string: "id"))
            try container.encode(domainName, forKey: .init(string: "domainName"))
            try container.encode(botUserId, forKey: .init(string: "botUserId"))
            try container.encode(browser, forKey: .init(string: "browser"))
            try container.encode(platform, forKey: .init(string: "platform"))
            try container.encodeDate(logInDate, forKey: .init(string: "logInDate"))
            try container.encodeDate(lastActiveDate, forKey: .init(string: "lastActiveDate"))
            try container.encode(ip, forKey: .init(string: "ip"))
            try container.encode(location, forKey: .init(string: "location"))
        }
    }
}
