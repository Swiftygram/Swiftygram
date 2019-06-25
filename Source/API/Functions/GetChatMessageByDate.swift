//
//  GetChatMessageByDate.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns the last message sent in a chat no later than the specified date

     - ReturnType: `TDObject.Message`
     */
    struct GetChatMessageByDate: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Message

        /**
         Chat identifier
         */
        public let chatId: Int64

        /**
         Point in time (Unix timestamp) relative to which to search for messages
         */
        public let date: Foundation.Date

        /**
         Returns the last message sent in a chat no later than the specified date

         - Parameter chatId: Chat identifier
         - Parameter date: Point in time (Unix timestamp) relative to which to search for messages
         */
        public init(chatId: Int64, date: Foundation.Date) {
            self.chatId = chatId
            self.date = date
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            date = try container.decodeDate(forKey: .init(string: "date"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encodeDate(date, forKey: .init(string: "date"))
        }
    }
}
