//
//  PushReceiverId.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains a globally unique push receiver identifier, which can be used to identify which account has received a push notification
     */
    struct PushReceiverId: TDObjectProtocol {
        /**
         The globally unique identifier of push notification subscription
         */
        public let id: Int64

        /**
         Contains a globally unique push receiver identifier, which can be used to identify which account has received a push notification

         - Parameter id: The globally unique identifier of push notification subscription
         */
        public init(id: Int64) {
            self.id = id
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            id = try container.decodeInt64(forKey: .init(string: "id"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(id, forKey: .init(string: "id"))
        }
    }
}
