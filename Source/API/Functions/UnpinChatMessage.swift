//
//  UnpinChatMessage.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Removes the pinned message from a chat; requires appropriate administrator rights in the group or channel

     - ReturnType: `TDObject.Ok`
     */
    struct UnpinChatMessage: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Identifier of the chat
         */
        public let chatId: Int64

        /**
         Removes the pinned message from a chat; requires appropriate administrator rights in the group or channel

         - Parameter chatId: Identifier of the chat
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
