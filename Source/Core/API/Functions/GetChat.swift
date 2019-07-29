//
//  GetChat.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns information about a chat by its identifier, this is an offline request if the current user is not a bot

     - ReturnType: `TDObject.Chat`
     */
    struct GetChat: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Chat

        /**
         Chat identifier
         */
        public var chatId: Int64

        /**
         Returns information about a chat by its identifier, this is an offline request if the current user is not a bot

         - Parameter chatId: Chat identifier
         */
        public init(chatId: Int64) {
            self.chatId = chatId
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
        }
    }
}
