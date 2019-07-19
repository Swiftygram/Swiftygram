//
//  GetChatHistory.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns messages in a chat. The messages are returned in a reverse chronological order (i.e., in order of decreasing message_id).-For optimal performance the number of returned messages is chosen by the library. This is an offline request if only_local is true

     - ReturnType: `TDObject.Messages`
     */
    struct GetChatHistory: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Messages

        /**
         Chat identifier
         */
        public var chatId: Int64

        /**
         Identifier of the message starting from which history must be fetched; use 0 to get results from the last message
         */
        public var fromMessageId: Int64

        /**
         Specify 0 to get results from exactly the from_message_id or a negative offset up to 99 to get additionally some newer messages
         */
        public var offset: Int

        /**
         The maximum number of messages to be returned; must be positive and can't be greater than 100. If the offset is negative, the limit must be greater or equal to -offset. Fewer messages may be returned than specified by the limit, even if the end of the message history has not been reached
         */
        public var limit: Int

        /**
         If true, returns only messages that are available locally without sending network requests
         */
        public var onlyLocal: Bool

        /**
         Returns messages in a chat. The messages are returned in a reverse chronological order (i.e., in order of decreasing message_id).-For optimal performance the number of returned messages is chosen by the library. This is an offline request if only_local is true

         - Parameter chatId: Chat identifier
         - Parameter fromMessageId: Identifier of the message starting from which history must be fetched; use 0 to get results from the last message
         - Parameter offset: Specify 0 to get results from exactly the from_message_id or a negative offset up to 99 to get additionally some newer messages
         - Parameter limit: The maximum number of messages to be returned; must be positive and can't be greater than 100. If the offset is negative, the limit must be greater or equal to -offset. Fewer messages may be returned than specified by the limit, even if the end of the message history has not been reached
         - Parameter onlyLocal: If true, returns only messages that are available locally without sending network requests
         */
        public init(chatId: Int64, fromMessageId: Int64, offset: Int, limit: Int, onlyLocal: Bool) {
            self.chatId = chatId
            self.fromMessageId = fromMessageId
            self.offset = offset
            self.limit = limit
            self.onlyLocal = onlyLocal
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            fromMessageId = try container.decodeInt64(forKey: .init(string: "fromMessageId"))
            offset = try container.decode(Int.self, forKey: .init(string: "offset"))
            limit = try container.decode(Int.self, forKey: .init(string: "limit"))
            onlyLocal = try container.decode(Bool.self, forKey: .init(string: "onlyLocal"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encodeInt64(fromMessageId, forKey: .init(string: "fromMessageId"))
            try container.encode(offset, forKey: .init(string: "offset"))
            try container.encode(limit, forKey: .init(string: "limit"))
            try container.encode(onlyLocal, forKey: .init(string: "onlyLocal"))
        }
    }
}
