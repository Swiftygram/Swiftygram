//
//  SetPollAnswer.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Changes user answer to a poll

     - ReturnType: `TDObject.Ok`
     */
    struct SetPollAnswer: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Identifier of the chat to which the poll belongs
         */
        public var chatId: Int64

        /**
         Identifier of the message containing the poll
         */
        public var messageId: Int64

        /**
         0-based identifiers of options, chosen by the user. Currently user can't choose more than 1 option
         */
        public var optionIds: [Int]

        /**
         Changes user answer to a poll

         - Parameter chatId: Identifier of the chat to which the poll belongs
         - Parameter messageId: Identifier of the message containing the poll
         - Parameter optionIds: 0-based identifiers of options, chosen by the user. Currently user can't choose more than 1 option
         */
        public init(chatId: Int64, messageId: Int64, optionIds: [Int]) {
            self.chatId = chatId
            self.messageId = messageId
            self.optionIds = optionIds
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            messageId = try container.decodeInt64(forKey: .init(string: "messageId"))
            optionIds = try container.decode([Int].self, forKey: .init(string: "optionIds"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encodeInt64(messageId, forKey: .init(string: "messageId"))
            try container.encode(optionIds, forKey: .init(string: "optionIds"))
        }
    }
}
