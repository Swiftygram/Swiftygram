//
//  SendChatAction.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Sends a notification about user activity in a chat

     - ReturnType: `TDObject.Ok`
     */
    struct SendChatAction: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Chat identifier
         */
        public let chatId: Int64

        /**
         The action description
         */
        public let action: TDEnum.ChatAction

        /**
         Sends a notification about user activity in a chat

         - Parameter chatId: Chat identifier
         - Parameter action: The action description
         */
        public init(chatId: Int64, action: TDEnum.ChatAction) {
            self.chatId = chatId
            self.action = action
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            action = try container.decode(TDEnum.ChatAction.self, forKey: .init(string: "action"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encode(action, forKey: .init(string: "action"))
        }
    }
}
