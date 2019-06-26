//
//  GetChatAdministrators.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns a list of users who are administrators of the chat

     - ReturnType: `TDObject.Users`
     */
    struct GetChatAdministrators: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Users

        /**
         Chat identifier
         */
        public let chatId: Int64

        /**
         Returns a list of users who are administrators of the chat

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
