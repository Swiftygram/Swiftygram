//
//  ChatEvent.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Represents a chat event
     */
    struct ChatEvent: TDObjectProtocol {
        /**
         Chat event identifier
         */
        public let id: Int64

        /**
         Point in time (Unix timestamp) when the event happened
         */
        public let date: Foundation.Date

        /**
         Identifier of the user who performed the action that triggered the event
         */
        public let userId: Int

        /**
         Action performed by the user
         */
        public let action: TDEnum.ChatEventAction

        /**
         Represents a chat event

         - Parameter id: Chat event identifier
         - Parameter date: Point in time (Unix timestamp) when the event happened
         - Parameter userId: Identifier of the user who performed the action that triggered the event
         - Parameter action: Action performed by the user
         */
        public init(id: Int64, date: Foundation.Date, userId: Int, action: TDEnum.ChatEventAction) {
            self.id = id
            self.date = date
            self.userId = userId
            self.action = action
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            id = try container.decodeInt64(forKey: .init(string: "id"))
            date = try container.decodeDate(forKey: .init(string: "date"))
            userId = try container.decode(Int.self, forKey: .init(string: "userId"))
            action = try container.decode(TDEnum.ChatEventAction.self, forKey: .init(string: "action"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(id, forKey: .init(string: "id"))
            try container.encodeDate(date, forKey: .init(string: "date"))
            try container.encode(userId, forKey: .init(string: "userId"))
            try container.encode(action, forKey: .init(string: "action"))
        }
    }
}
