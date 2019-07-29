//
//  FoundMessages.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains a list of messages found by a search
     */
    struct FoundMessages: TDObjectProtocol {
        /**
         List of messages
         */
        public var messages: [TDObject.Message]

        /**
         Value to pass as from_search_id to get more results
         */
        public var nextFromSearchId: Int64

        /**
         Contains a list of messages found by a search

         - Parameter messages: List of messages
         - Parameter nextFromSearchId: Value to pass as from_search_id to get more results
         */
        public init(messages: [TDObject.Message], nextFromSearchId: Int64) {
            self.messages = messages
            self.nextFromSearchId = nextFromSearchId
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            messages = try container.decode([TDObject.Message].self, forKey: .init(string: "messages"))
            nextFromSearchId = try container.decodeInt64(forKey: .init(string: "nextFromSearchId"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encode(messages, forKey: .init(string: "messages"))
            try container.encodeInt64(nextFromSearchId, forKey: .init(string: "nextFromSearchId"))
        }
    }
}
