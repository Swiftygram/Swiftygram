//
//  ReportSupergroupSpam.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Reports some messages from a user in a supergroup as spam; requires administrator rights in the supergroup

     - ReturnType: `TDObject.Ok`
     */
    struct ReportSupergroupSpam: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Supergroup identifier
         */
        public let supergroupId: Int

        /**
         User identifier
         */
        public let userId: Int

        /**
         Identifiers of messages sent in the supergroup by the user. This list must be non-empty
         */
        public let messageIds: [Int64]

        /**
         Reports some messages from a user in a supergroup as spam; requires administrator rights in the supergroup

         - Parameter supergroupId: Supergroup identifier
         - Parameter userId: User identifier
         - Parameter messageIds: Identifiers of messages sent in the supergroup by the user. This list must be non-empty
         */
        public init(supergroupId: Int, userId: Int, messageIds: [Int64]) {
            self.supergroupId = supergroupId
            self.userId = userId
            self.messageIds = messageIds
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            supergroupId = try container.decode(Int.self, forKey: .init(string: "supergroupId"))
            userId = try container.decode(Int.self, forKey: .init(string: "userId"))
            messageIds = try container.decodeInt64Array(forKey: .init(string: "messageIds"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encode(supergroupId, forKey: .init(string: "supergroupId"))
            try container.encode(userId, forKey: .init(string: "userId"))
            try container.encodeInt64Array(messageIds, forKey: .init(string: "messageIds"))
        }
    }
}
