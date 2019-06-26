//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Sends the result of an inline query as a message. Returns the sent message. Always clears a chat draft message

     - ReturnType: `TDObject.Message`
     */
    struct SendInlineQueryResultMessage: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Message

        /**
         Target chat
         */
        public var chatId: Int64

        /**
         Identifier of a message to reply to or 0
         */
        public var replyToMessageId: Int64

        /**
         Pass true to disable notification for the message. Not supported in secret chats
         */
        public var disableNotification: Bool

        /**
         Pass true if the message is sent from background
         */
        public var fromBackground: Bool

        /**
         Identifier of the inline query
         */
        public var queryId: Int64

        /**
         Identifier of the inline result
         */
        public var resultId: String

        /**
         If true, there will be no mention of a bot, via which the message is sent. Can be used only for bots GetOption("animation_search_bot_username"), GetOption("photo_search_bot_username") and GetOption("venue_search_bot_username")
         */
        public var hideViaBot: Bool

        /**
         Sends the result of an inline query as a message. Returns the sent message. Always clears a chat draft message

         - Parameter chatId: Target chat
         - Parameter replyToMessageId: Identifier of a message to reply to or 0
         - Parameter disableNotification: Pass true to disable notification for the message. Not supported in secret chats
         - Parameter fromBackground: Pass true if the message is sent from background
         - Parameter queryId: Identifier of the inline query
         - Parameter resultId: Identifier of the inline result
         - Parameter hideViaBot: If true, there will be no mention of a bot, via which the message is sent. Can be used only for bots GetOption("animation_search_bot_username"), GetOption("photo_search_bot_username") and GetOption("venue_search_bot_username")
         */
        public init(chatId: Int64, replyToMessageId: Int64, disableNotification: Bool, fromBackground: Bool, queryId: Int64, resultId: String, hideViaBot: Bool) {
            self.chatId = chatId
            self.replyToMessageId = replyToMessageId
            self.disableNotification = disableNotification
            self.fromBackground = fromBackground
            self.queryId = queryId
            self.resultId = resultId
            self.hideViaBot = hideViaBot
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            replyToMessageId = try container.decodeInt64(forKey: .init(string: "replyToMessageId"))
            disableNotification = try container.decode(Bool.self, forKey: .init(string: "disableNotification"))
            fromBackground = try container.decode(Bool.self, forKey: .init(string: "fromBackground"))
            queryId = try container.decodeInt64(forKey: .init(string: "queryId"))
            resultId = try container.decode(String.self, forKey: .init(string: "resultId"))
            hideViaBot = try container.decode(Bool.self, forKey: .init(string: "hideViaBot"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encodeInt64(replyToMessageId, forKey: .init(string: "replyToMessageId"))
            try container.encode(disableNotification, forKey: .init(string: "disableNotification"))
            try container.encode(fromBackground, forKey: .init(string: "fromBackground"))
            try container.encodeInt64(queryId, forKey: .init(string: "queryId"))
            try container.encode(resultId, forKey: .init(string: "resultId"))
            try container.encode(hideViaBot, forKey: .init(string: "hideViaBot"))
        }
    }
}
