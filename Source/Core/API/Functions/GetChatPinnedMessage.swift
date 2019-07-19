//
//  GetChatPinnedMessage.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns information about a pinned chat message

     - ReturnType: `TDObject.Message`
     */
    struct GetChatPinnedMessage: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Message

        /**
         Identifier of the chat the message belongs to
         */
        public var chatId: Int64

        /**
         Returns information about a pinned chat message

         - Parameter chatId: Identifier of the chat the message belongs to
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
