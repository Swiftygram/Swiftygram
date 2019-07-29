//
//  UpdateNewInlineQuery.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     A new incoming inline query; for bots only
     */
    struct UpdateNewInlineQuery: TDObject.Update {
        /**
         Unique query identifier
         */
        public var id: Int64

        /**
         Identifier of the user who sent the query
         */
        public var senderUserId: Int

        /**
         User location, provided by the client; may be null
         */
        public var userLocation: TDObject.Location?

        /**
         Text of the query
         */
        public var query: String

        /**
         Offset of the first entry to return
         */
        public var offset: String

        /**
         A new incoming inline query; for bots only

         - Parameter id: Unique query identifier
         - Parameter senderUserId: Identifier of the user who sent the query
         - Parameter userLocation: User location, provided by the client; may be null
         - Parameter query: Text of the query
         - Parameter offset: Offset of the first entry to return
         */
        public init(id: Int64, senderUserId: Int, userLocation: TDObject.Location?, query: String, offset: String) {
            self.id = id
            self.senderUserId = senderUserId
            self.userLocation = userLocation
            self.query = query
            self.offset = offset
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            id = try container.decodeInt64(forKey: .init(string: "id"))
            senderUserId = try container.decode(Int.self, forKey: .init(string: "senderUserId"))
            userLocation = try container.decodeIfPresent(TDObject.Location.self, forKey: .init(string: "userLocation"))
            query = try container.decode(String.self, forKey: .init(string: "query"))
            offset = try container.decode(String.self, forKey: .init(string: "offset"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(id, forKey: .init(string: "id"))
            try container.encode(senderUserId, forKey: .init(string: "senderUserId"))
            try container.encodeIfPresent(userLocation, forKey: .init(string: "userLocation"))
            try container.encode(query, forKey: .init(string: "query"))
            try container.encode(offset, forKey: .init(string: "offset"))
        }
    }
}
