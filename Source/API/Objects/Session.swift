//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains information about one session in a Telegram application used by the current user. Sessions should be shown to the user in the returned order
     */
    struct Session: TDObjectProtocol {
        /**
         Session identifier
         */
        public var id: Int64

        /**
         True, if this session is the current session
         */
        public var isCurrent: Bool

        /**
         True, if a password is needed to complete authorization of the session
         */
        public var isPasswordPending: Bool

        /**
         Telegram API identifier, as provided by the application
         */
        public var apiId: Int

        /**
         Name of the application, as provided by the application
         */
        public var applicationName: String

        /**
         The version of the application, as provided by the application
         */
        public var applicationVersion: String

        /**
         True, if the application is an official application or uses the api_id of an official application
         */
        public var isOfficialApplication: Bool

        /**
         Model of the device the application has been run or is running on, as provided by the application
         */
        public var deviceModel: String

        /**
         Operating system the application has been run or is running on, as provided by the application
         */
        public var platform: String

        /**
         Version of the operating system the application has been run or is running on, as provided by the application
         */
        public var systemVersion: String

        /**
         Point in time (Unix timestamp) when the user has logged in
         */
        public var logInDate: Foundation.Date

        /**
         Point in time (Unix timestamp) when the session was last used
         */
        public var lastActiveDate: Foundation.Date

        /**
         IP address from which the session was created, in human-readable format
         */
        public var ip: String

        /**
         A two-letter country code for the country from which the session was created, based on the IP address
         */
        public var country: String

        /**
         Region code from which the session was created, based on the IP address
         */
        public var region: String

        /**
         Contains information about one session in a Telegram application used by the current user. Sessions should be shown to the user in the returned order

         - Parameter id: Session identifier
         - Parameter isCurrent: True, if this session is the current session
         - Parameter isPasswordPending: True, if a password is needed to complete authorization of the session
         - Parameter apiId: Telegram API identifier, as provided by the application
         - Parameter applicationName: Name of the application, as provided by the application
         - Parameter applicationVersion: The version of the application, as provided by the application
         - Parameter isOfficialApplication: True, if the application is an official application or uses the api_id of an official application
         - Parameter deviceModel: Model of the device the application has been run or is running on, as provided by the application
         - Parameter platform: Operating system the application has been run or is running on, as provided by the application
         - Parameter systemVersion: Version of the operating system the application has been run or is running on, as provided by the application
         - Parameter logInDate: Point in time (Unix timestamp) when the user has logged in
         - Parameter lastActiveDate: Point in time (Unix timestamp) when the session was last used
         - Parameter ip: IP address from which the session was created, in human-readable format
         - Parameter country: A two-letter country code for the country from which the session was created, based on the IP address
         - Parameter region: Region code from which the session was created, based on the IP address
         */
        public init(id: Int64, isCurrent: Bool, isPasswordPending: Bool, apiId: Int, applicationName: String, applicationVersion: String, isOfficialApplication: Bool, deviceModel: String, platform: String, systemVersion: String, logInDate: Foundation.Date, lastActiveDate: Foundation.Date, ip: String, country: String, region: String) {
            self.id = id
            self.isCurrent = isCurrent
            self.isPasswordPending = isPasswordPending
            self.apiId = apiId
            self.applicationName = applicationName
            self.applicationVersion = applicationVersion
            self.isOfficialApplication = isOfficialApplication
            self.deviceModel = deviceModel
            self.platform = platform
            self.systemVersion = systemVersion
            self.logInDate = logInDate
            self.lastActiveDate = lastActiveDate
            self.ip = ip
            self.country = country
            self.region = region
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            id = try container.decodeInt64(forKey: .init(string: "id"))
            isCurrent = try container.decode(Bool.self, forKey: .init(string: "isCurrent"))
            isPasswordPending = try container.decode(Bool.self, forKey: .init(string: "isPasswordPending"))
            apiId = try container.decode(Int.self, forKey: .init(string: "apiId"))
            applicationName = try container.decode(String.self, forKey: .init(string: "applicationName"))
            applicationVersion = try container.decode(String.self, forKey: .init(string: "applicationVersion"))
            isOfficialApplication = try container.decode(Bool.self, forKey: .init(string: "isOfficialApplication"))
            deviceModel = try container.decode(String.self, forKey: .init(string: "deviceModel"))
            platform = try container.decode(String.self, forKey: .init(string: "platform"))
            systemVersion = try container.decode(String.self, forKey: .init(string: "systemVersion"))
            logInDate = try container.decodeDate(forKey: .init(string: "logInDate"))
            lastActiveDate = try container.decodeDate(forKey: .init(string: "lastActiveDate"))
            ip = try container.decode(String.self, forKey: .init(string: "ip"))
            country = try container.decode(String.self, forKey: .init(string: "country"))
            region = try container.decode(String.self, forKey: .init(string: "region"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(id, forKey: .init(string: "id"))
            try container.encode(isCurrent, forKey: .init(string: "isCurrent"))
            try container.encode(isPasswordPending, forKey: .init(string: "isPasswordPending"))
            try container.encode(apiId, forKey: .init(string: "apiId"))
            try container.encode(applicationName, forKey: .init(string: "applicationName"))
            try container.encode(applicationVersion, forKey: .init(string: "applicationVersion"))
            try container.encode(isOfficialApplication, forKey: .init(string: "isOfficialApplication"))
            try container.encode(deviceModel, forKey: .init(string: "deviceModel"))
            try container.encode(platform, forKey: .init(string: "platform"))
            try container.encode(systemVersion, forKey: .init(string: "systemVersion"))
            try container.encodeDate(logInDate, forKey: .init(string: "logInDate"))
            try container.encodeDate(lastActiveDate, forKey: .init(string: "lastActiveDate"))
            try container.encode(ip, forKey: .init(string: "ip"))
            try container.encode(country, forKey: .init(string: "country"))
            try container.encode(region, forKey: .init(string: "region"))
        }
    }
}
