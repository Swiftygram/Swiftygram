//
//  DraftMessage.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains information about a message draft
     */
    struct DraftMessage: TDObjectProtocol {
        /**
         Identifier of the message to reply to; 0 if none
         */
        public var replyToMessageId: Int64

        /**
         Content of the message draft; this should always be of type inputMessageText
         */
        public var inputMessageText: TDEnum.InputMessageContent

        /**
         Contains information about a message draft

         - Parameter replyToMessageId: Identifier of the message to reply to; 0 if none
         - Parameter inputMessageText: Content of the message draft; this should always be of type inputMessageText
         */
        public init(replyToMessageId: Int64, inputMessageText: TDEnum.InputMessageContent) {
            self.replyToMessageId = replyToMessageId
            self.inputMessageText = inputMessageText
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            replyToMessageId = try container.decodeInt64(forKey: .init(string: "replyToMessageId"))
            inputMessageText = try container.decode(TDEnum.InputMessageContent.self, forKey: .init(string: "inputMessageText"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(replyToMessageId, forKey: .init(string: "replyToMessageId"))
            try container.encode(inputMessageText, forKey: .init(string: "inputMessageText"))
        }
    }
}
