//
//  GetGameHighScores.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns the high scores for a game and some part of the high score table in the range of the specified user; for bots only

     - ReturnType: `TDObject.GameHighScores`
     */
    struct GetGameHighScores: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.GameHighScores

        /**
         The chat that contains the message with the game
         */
        public let chatId: Int64

        /**
         Identifier of the message
         */
        public let messageId: Int64

        /**
         User identifier
         */
        public let userId: Int

        /**
         Returns the high scores for a game and some part of the high score table in the range of the specified user; for bots only

         - Parameter chatId: The chat that contains the message with the game
         - Parameter messageId: Identifier of the message
         - Parameter userId: User identifier
         */
        public init(chatId: Int64, messageId: Int64, userId: Int) {
            self.chatId = chatId
            self.messageId = messageId
            self.userId = userId
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            messageId = try container.decodeInt64(forKey: .init(string: "messageId"))
            userId = try container.decode(Int.self, forKey: .init(string: "userId"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encodeInt64(messageId, forKey: .init(string: "messageId"))
            try container.encode(userId, forKey: .init(string: "userId"))
        }
    }
}
