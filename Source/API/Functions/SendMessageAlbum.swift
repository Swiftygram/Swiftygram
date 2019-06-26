//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Sends messages grouped together into an album. Currently only photo and video messages can be grouped into an album. Returns sent messages

     - ReturnType: `TDObject.Messages`
     */
    struct SendMessageAlbum: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Messages

        /**
         Target chat
         */
        public var chatId: Int64

        /**
         Identifier of a message to reply to or 0
         */
        public var replyToMessageId: Int64

        /**
         Pass true to disable notification for the messages. Not supported in secret chats
         */
        public var disableNotification: Bool

        /**
         Pass true if the messages are sent from the background
         */
        public var fromBackground: Bool

        /**
         Contents of messages to be sent
         */
        public var inputMessageContents: [TDEnum.InputMessageContent]

        /**
         Sends messages grouped together into an album. Currently only photo and video messages can be grouped into an album. Returns sent messages

         - Parameter chatId: Target chat
         - Parameter replyToMessageId: Identifier of a message to reply to or 0
         - Parameter disableNotification: Pass true to disable notification for the messages. Not supported in secret chats
         - Parameter fromBackground: Pass true if the messages are sent from the background
         - Parameter inputMessageContents: Contents of messages to be sent
         */
        public init(chatId: Int64, replyToMessageId: Int64, disableNotification: Bool, fromBackground: Bool, inputMessageContents: [TDEnum.InputMessageContent]) {
            self.chatId = chatId
            self.replyToMessageId = replyToMessageId
            self.disableNotification = disableNotification
            self.fromBackground = fromBackground
            self.inputMessageContents = inputMessageContents
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            replyToMessageId = try container.decodeInt64(forKey: .init(string: "replyToMessageId"))
            disableNotification = try container.decode(Bool.self, forKey: .init(string: "disableNotification"))
            fromBackground = try container.decode(Bool.self, forKey: .init(string: "fromBackground"))
            inputMessageContents = try container.decode([TDEnum.InputMessageContent].self, forKey: .init(string: "inputMessageContents"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encodeInt64(replyToMessageId, forKey: .init(string: "replyToMessageId"))
            try container.encode(disableNotification, forKey: .init(string: "disableNotification"))
            try container.encode(fromBackground, forKey: .init(string: "fromBackground"))
            try container.encode(inputMessageContents, forKey: .init(string: "inputMessageContents"))
        }
    }
}
