//
//  SetChatDraftMessage.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Changes the draft message in a chat

     - ReturnType: `TDObject.Ok`
     */
    struct SetChatDraftMessage: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Chat identifier
         */
        public var chatId: Int64

        /**
         New draft message; may be null
         */
        public var draftMessage: TDObject.DraftMessage?

        /**
         Changes the draft message in a chat

         - Parameter chatId: Chat identifier
         - Parameter draftMessage: New draft message; may be null
         */
        public init(chatId: Int64, draftMessage: TDObject.DraftMessage?) {
            self.chatId = chatId
            self.draftMessage = draftMessage
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            draftMessage = try container.decodeIfPresent(TDObject.DraftMessage.self, forKey: .init(string: "draftMessage"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encodeIfPresent(draftMessage, forKey: .init(string: "draftMessage"))
        }
    }
}
