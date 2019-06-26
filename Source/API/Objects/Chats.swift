//
//  Chats.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Represents a list of chats
     */
    struct Chats: TDObjectProtocol {
        /**
         List of chat identifiers
         */
        public let chatIds: [Int64]

        /**
         Represents a list of chats

         - Parameter chatIds: List of chat identifiers
         */
        public init(chatIds: [Int64]) {
            self.chatIds = chatIds
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatIds = try container.decodeInt64Array(forKey: .init(string: "chatIds"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64Array(chatIds, forKey: .init(string: "chatIds"))
        }
    }
}
