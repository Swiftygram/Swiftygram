//
//  ReportChat.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Reports a chat to the Telegram moderators. Supported only for supergroups, channels, or private chats with bots, since other chats can't be checked by moderators

     - ReturnType: `TDObject.Ok`
     */
    struct ReportChat: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Chat identifier
         */
        public var chatId: Int64

        /**
         The reason for reporting the chat
         */
        public var reason: TDEnum.ChatReportReason

        /**
         Identifiers of reported messages, if any
         */
        public var messageIds: [Int64]

        /**
         Reports a chat to the Telegram moderators. Supported only for supergroups, channels, or private chats with bots, since other chats can't be checked by moderators

         - Parameter chatId: Chat identifier
         - Parameter reason: The reason for reporting the chat
         - Parameter messageIds: Identifiers of reported messages, if any
         */
        public init(chatId: Int64, reason: TDEnum.ChatReportReason, messageIds: [Int64]) {
            self.chatId = chatId
            self.reason = reason
            self.messageIds = messageIds
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            reason = try container.decode(TDEnum.ChatReportReason.self, forKey: .init(string: "reason"))
            messageIds = try container.decodeInt64Array(forKey: .init(string: "messageIds"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encode(reason, forKey: .init(string: "reason"))
            try container.encodeInt64Array(messageIds, forKey: .init(string: "messageIds"))
        }
    }
}
