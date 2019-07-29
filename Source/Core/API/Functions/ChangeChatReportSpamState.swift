//
//  ChangeChatReportSpamState.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Reports to the server whether a chat is a spam chat or not. Can be used only if ChatReportSpamState.can_report_spam is true. After this request, ChatReportSpamState.can_report_spam becomes false forever

     - ReturnType: `TDObject.Ok`
     */
    struct ChangeChatReportSpamState: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Chat identifier
         */
        public var chatId: Int64

        /**
         If true, the chat will be reported as spam; otherwise it will be marked as not spam
         */
        public var isSpamChat: Bool

        /**
         Reports to the server whether a chat is a spam chat or not. Can be used only if ChatReportSpamState.can_report_spam is true. After this request, ChatReportSpamState.can_report_spam becomes false forever

         - Parameter chatId: Chat identifier
         - Parameter isSpamChat: If true, the chat will be reported as spam; otherwise it will be marked as not spam
         */
        public init(chatId: Int64, isSpamChat: Bool) {
            self.chatId = chatId
            self.isSpamChat = isSpamChat
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            isSpamChat = try container.decode(Bool.self, forKey: .init(string: "isSpamChat"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encode(isSpamChat, forKey: .init(string: "isSpamChat"))
        }
    }
}
