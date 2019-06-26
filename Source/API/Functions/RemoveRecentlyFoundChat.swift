//
//  RemoveRecentlyFoundChat.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Removes a chat from the list of recently found chats

     - ReturnType: `TDObject.Ok`
     */
    struct RemoveRecentlyFoundChat: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Identifier of the chat to be removed
         */
        public let chatId: Int64

        /**
         Removes a chat from the list of recently found chats

         - Parameter chatId: Identifier of the chat to be removed
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
