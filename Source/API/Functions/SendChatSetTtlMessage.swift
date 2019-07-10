//
//  SendChatSetTtlMessage.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Changes the current TTL setting (sets a new self-destruct timer) in a secret chat and sends the corresponding message

     - ReturnType: `TDObject.Message`
     */
    struct SendChatSetTtlMessage: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Message

        /**
         Chat identifier
         */
        public var chatId: Int64

        /**
         New TTL value, in seconds
         */
        public var ttl: Int

        /**
         Changes the current TTL setting (sets a new self-destruct timer) in a secret chat and sends the corresponding message

         - Parameter chatId: Chat identifier
         - Parameter ttl: New TTL value, in seconds
         */
        public init(chatId: Int64, ttl: Int) {
            self.chatId = chatId
            self.ttl = ttl
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            ttl = try container.decode(Int.self, forKey: .init(string: "ttl"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encode(ttl, forKey: .init(string: "ttl"))
        }
    }
}
