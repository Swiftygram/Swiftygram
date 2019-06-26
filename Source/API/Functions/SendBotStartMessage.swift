//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Invites a bot to a chat (if it is not yet a member) and sends it the /start command. Bots can't be invited to a private chat other than the chat with the bot. Bots can't be invited to channels (although they can be added as admins) and secret chats. Returns the sent message

     - ReturnType: `TDObject.Message`
     */
    struct SendBotStartMessage: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Message

        /**
         Identifier of the bot
         */
        public var botUserId: Int

        /**
         Identifier of the target chat
         */
        public var chatId: Int64

        /**
         A hidden parameter sent to the bot for deep linking purposes (https://api.telegram.org/bots#deep-linking)
         */
        public var parameter: String

        /**
         Invites a bot to a chat (if it is not yet a member) and sends it the /start command. Bots can't be invited to a private chat other than the chat with the bot. Bots can't be invited to channels (although they can be added as admins) and secret chats. Returns the sent message

         - Parameter botUserId: Identifier of the bot
         - Parameter chatId: Identifier of the target chat
         - Parameter parameter: A hidden parameter sent to the bot for deep linking purposes (https://api.telegram.org/bots#deep-linking)
         */
        public init(botUserId: Int, chatId: Int64, parameter: String) {
            self.botUserId = botUserId
            self.chatId = chatId
            self.parameter = parameter
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            botUserId = try container.decode(Int.self, forKey: .init(string: "botUserId"))
            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            parameter = try container.decode(String.self, forKey: .init(string: "parameter"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encode(botUserId, forKey: .init(string: "botUserId"))
            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encode(parameter, forKey: .init(string: "parameter"))
        }
    }
}
