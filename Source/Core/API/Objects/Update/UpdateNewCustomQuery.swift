//
//  UpdateNewCustomQuery.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     A new incoming query; for bots only
     */
    struct UpdateNewCustomQuery: TDObject.Update {
        /**
         The query identifier
         */
        public var id: Int64

        /**
         JSON-serialized query data
         */
        public var data: String

        /**
         Query timeout
         */
        public var timeout: Int

        /**
         A new incoming query; for bots only

         - Parameter id: The query identifier
         - Parameter data: JSON-serialized query data
         - Parameter timeout: Query timeout
         */
        public init(id: Int64, data: String, timeout: Int) {
            self.id = id
            self.data = data
            self.timeout = timeout
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            id = try container.decodeInt64(forKey: .init(string: "id"))
            data = try container.decode(String.self, forKey: .init(string: "data"))
            timeout = try container.decode(Int.self, forKey: .init(string: "timeout"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(id, forKey: .init(string: "id"))
            try container.encode(data, forKey: .init(string: "data"))
            try container.encode(timeout, forKey: .init(string: "timeout"))
        }
    }
}
