//
//  AddLocalMessage.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Adds a local message to a chat. The message is persistent across application restarts only if the message database is used. Returns the added message

     - ReturnType: `TDObject.Message`
     */
    struct AddLocalMessage: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Message

        /**
         Target chat
         */
        public var chatId: Int64

        /**
         Identifier of the user who will be shown as the sender of the message; may be 0 for channel posts
         */
        public var senderUserId: Int

        /**
         Identifier of the message to reply to or 0
         */
        public var replyToMessageId: Int64

        /**
         Pass true to disable notification for the message
         */
        public var disableNotification: Bool

        /**
         The content of the message to be added
         */
        public var inputMessageContent: TDEnum.InputMessageContent

        /**
         Adds a local message to a chat. The message is persistent across application restarts only if the message database is used. Returns the added message

         - Parameter chatId: Target chat
         - Parameter senderUserId: Identifier of the user who will be shown as the sender of the message; may be 0 for channel posts
         - Parameter replyToMessageId: Identifier of the message to reply to or 0
         - Parameter disableNotification: Pass true to disable notification for the message
         - Parameter inputMessageContent: The content of the message to be added
         */
        public init(chatId: Int64, senderUserId: Int, replyToMessageId: Int64, disableNotification: Bool, inputMessageContent: TDEnum.InputMessageContent) {
            self.chatId = chatId
            self.senderUserId = senderUserId
            self.replyToMessageId = replyToMessageId
            self.disableNotification = disableNotification
            self.inputMessageContent = inputMessageContent
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            senderUserId = try container.decode(Int.self, forKey: .init(string: "senderUserId"))
            replyToMessageId = try container.decodeInt64(forKey: .init(string: "replyToMessageId"))
            disableNotification = try container.decode(Bool.self, forKey: .init(string: "disableNotification"))
            inputMessageContent = try container.decode(TDEnum.InputMessageContent.self, forKey: .init(string: "inputMessageContent"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encode(senderUserId, forKey: .init(string: "senderUserId"))
            try container.encodeInt64(replyToMessageId, forKey: .init(string: "replyToMessageId"))
            try container.encode(disableNotification, forKey: .init(string: "disableNotification"))
            try container.encode(inputMessageContent, forKey: .init(string: "inputMessageContent"))
        }
    }
}
