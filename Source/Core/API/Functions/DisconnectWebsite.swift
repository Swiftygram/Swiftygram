//
//  DisconnectWebsite.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Disconnects website from the current user's Telegram account

     - ReturnType: `TDObject.Ok`
     */
    struct DisconnectWebsite: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Website identifier
         */
        public var websiteId: Int64

        /**
         Disconnects website from the current user's Telegram account

         - Parameter websiteId: Website identifier
         */
        public init(websiteId: Int64) {
            self.websiteId = websiteId
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            websiteId = try container.decodeInt64(forKey: .init(string: "websiteId"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(websiteId, forKey: .init(string: "websiteId"))
        }
    }
}
