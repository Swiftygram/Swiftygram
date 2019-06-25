//
//  GetChatMessageCount.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns approximate number of messages of the specified type in the chat

     - ReturnType: `TDObject.Count`
     */
    struct GetChatMessageCount: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Count

        /**
         Identifier of the chat in which to count messages
         */
        public let chatId: Int64

        /**
         Filter for message content; searchMessagesFilterEmpty is unsupported in this function
         */
        public let filter: TDEnum.SearchMessagesFilter

        /**
         If true, returns count that is available locally without sending network requests, returning -1 if the number of messages is unknown
         */
        public let returnLocal: Bool

        /**
         Returns approximate number of messages of the specified type in the chat

         - Parameter chatId: Identifier of the chat in which to count messages
         - Parameter filter: Filter for message content; searchMessagesFilterEmpty is unsupported in this function
         - Parameter returnLocal: If true, returns count that is available locally without sending network requests, returning -1 if the number of messages is unknown
         */
        public init(chatId: Int64, filter: TDEnum.SearchMessagesFilter, returnLocal: Bool) {
            self.chatId = chatId
            self.filter = filter
            self.returnLocal = returnLocal
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            filter = try container.decode(TDEnum.SearchMessagesFilter.self, forKey: .init(string: "filter"))
            returnLocal = try container.decode(Bool.self, forKey: .init(string: "returnLocal"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encode(filter, forKey: .init(string: "filter"))
            try container.encode(returnLocal, forKey: .init(string: "returnLocal"))
        }
    }
}
