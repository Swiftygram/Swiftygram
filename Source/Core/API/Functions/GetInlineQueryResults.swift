//
//  GetInlineQueryResults.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Sends an inline query to a bot and returns its results. Returns an error with code 502 if the bot fails to answer the query before the query timeout expires

     - ReturnType: `TDObject.InlineQueryResults`
     */
    struct GetInlineQueryResults: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.InlineQueryResults

        /**
         The identifier of the target bot
         */
        public var botUserId: Int

        /**
         Identifier of the chat, where the query was sent
         */
        public var chatId: Int64

        /**
         Location of the user, only if needed
         */
        public var userLocation: TDObject.Location

        /**
         Text of the query
         */
        public var query: String

        /**
         Offset of the first entry to return
         */
        public var offset: String

        /**
         Sends an inline query to a bot and returns its results. Returns an error with code 502 if the bot fails to answer the query before the query timeout expires

         - Parameter botUserId: The identifier of the target bot
         - Parameter chatId: Identifier of the chat, where the query was sent
         - Parameter userLocation: Location of the user, only if needed
         - Parameter query: Text of the query
         - Parameter offset: Offset of the first entry to return
         */
        public init(botUserId: Int, chatId: Int64, userLocation: TDObject.Location, query: String, offset: String) {
            self.botUserId = botUserId
            self.chatId = chatId
            self.userLocation = userLocation
            self.query = query
            self.offset = offset
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            botUserId = try container.decode(Int.self, forKey: .init(string: "botUserId"))
            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            userLocation = try container.decode(TDObject.Location.self, forKey: .init(string: "userLocation"))
            query = try container.decode(String.self, forKey: .init(string: "query"))
            offset = try container.decode(String.self, forKey: .init(string: "offset"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encode(botUserId, forKey: .init(string: "botUserId"))
            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encode(userLocation, forKey: .init(string: "userLocation"))
            try container.encode(query, forKey: .init(string: "query"))
            try container.encode(offset, forKey: .init(string: "offset"))
        }
    }
}
