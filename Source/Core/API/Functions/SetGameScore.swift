//
//  SetGameScore.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Updates the game score of the specified user in the game; for bots only

     - ReturnType: `TDObject.Message`
     */
    struct SetGameScore: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Message

        /**
         The chat to which the message with the game belongs
         */
        public var chatId: Int64

        /**
         Identifier of the message
         */
        public var messageId: Int64

        /**
         True, if the message should be edited
         */
        public var editMessage: Bool

        /**
         User identifier
         */
        public var userId: Int

        /**
         The new score
         */
        public var score: Int

        /**
         Pass true to update the score even if it decreases. If the score is 0, the user will be deleted from the high score table
         */
        public var force: Bool

        /**
         Updates the game score of the specified user in the game; for bots only

         - Parameter chatId: The chat to which the message with the game belongs
         - Parameter messageId: Identifier of the message
         - Parameter editMessage: True, if the message should be edited
         - Parameter userId: User identifier
         - Parameter score: The new score
         - Parameter force: Pass true to update the score even if it decreases. If the score is 0, the user will be deleted from the high score table
         */
        public init(chatId: Int64, messageId: Int64, editMessage: Bool, userId: Int, score: Int, force: Bool) {
            self.chatId = chatId
            self.messageId = messageId
            self.editMessage = editMessage
            self.userId = userId
            self.score = score
            self.force = force
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            messageId = try container.decodeInt64(forKey: .init(string: "messageId"))
            editMessage = try container.decode(Bool.self, forKey: .init(string: "editMessage"))
            userId = try container.decode(Int.self, forKey: .init(string: "userId"))
            score = try container.decode(Int.self, forKey: .init(string: "score"))
            force = try container.decode(Bool.self, forKey: .init(string: "force"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encodeInt64(messageId, forKey: .init(string: "messageId"))
            try container.encode(editMessage, forKey: .init(string: "editMessage"))
            try container.encode(userId, forKey: .init(string: "userId"))
            try container.encode(score, forKey: .init(string: "score"))
            try container.encode(force, forKey: .init(string: "force"))
        }
    }
}
