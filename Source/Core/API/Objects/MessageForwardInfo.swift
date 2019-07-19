//
//  MessageForwardInfo.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains information about a forwarded message
     */
    struct MessageForwardInfo: TDObjectProtocol {
        /**
         Origin of a forwarded message
         */
        public var origin: TDEnum.MessageForwardOrigin

        /**
         Point in time (Unix timestamp) when the message was originally sent
         */
        public var date: Foundation.Date

        /**
         For messages forwarded to the chat with the current user (saved messages), the identifier of the chat from which the message was forwarded last time; 0 if unknown
         */
        public var fromChatId: Int64

        /**
         For messages forwarded to the chat with the current user (saved messages), the identifier of the original message from which the new message was forwarded last time; 0 if unknown
         */
        public var fromMessageId: Int64

        /**
         Contains information about a forwarded message

         - Parameter origin: Origin of a forwarded message
         - Parameter date: Point in time (Unix timestamp) when the message was originally sent
         - Parameter fromChatId: For messages forwarded to the chat with the current user (saved messages), the identifier of the chat from which the message was forwarded last time; 0 if unknown
         - Parameter fromMessageId: For messages forwarded to the chat with the current user (saved messages), the identifier of the original message from which the new message was forwarded last time; 0 if unknown
         */
        public init(origin: TDEnum.MessageForwardOrigin, date: Foundation.Date, fromChatId: Int64, fromMessageId: Int64) {
            self.origin = origin
            self.date = date
            self.fromChatId = fromChatId
            self.fromMessageId = fromMessageId
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            origin = try container.decode(TDEnum.MessageForwardOrigin.self, forKey: .init(string: "origin"))
            date = try container.decodeDate(forKey: .init(string: "date"))
            fromChatId = try container.decodeInt64(forKey: .init(string: "fromChatId"))
            fromMessageId = try container.decodeInt64(forKey: .init(string: "fromMessageId"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encode(origin, forKey: .init(string: "origin"))
            try container.encodeDate(date, forKey: .init(string: "date"))
            try container.encodeInt64(fromChatId, forKey: .init(string: "fromChatId"))
            try container.encodeInt64(fromMessageId, forKey: .init(string: "fromMessageId"))
        }
    }
}
