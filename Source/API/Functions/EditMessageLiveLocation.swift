//
//  EditMessageLiveLocation.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Edits the message content of a live location. Messages can be edited for a limited period of time specified in the live location. Returns the edited message after the edit is completed on the server side

     - ReturnType: `TDObject.Message`
     */
    struct EditMessageLiveLocation: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Message

        /**
         The chat the message belongs to
         */
        public var chatId: Int64

        /**
         Identifier of the message
         */
        public var messageId: Int64

        /**
         The new message reply markup; for bots only
         */
        public var replyMarkup: TDEnum.ReplyMarkup

        /**
         New location content of the message; may be null. Pass null to stop sharing the live location
         */
        public var location: TDObject.Location

        /**
         Edits the message content of a live location. Messages can be edited for a limited period of time specified in the live location. Returns the edited message after the edit is completed on the server side

         - Parameter chatId: The chat the message belongs to
         - Parameter messageId: Identifier of the message
         - Parameter replyMarkup: The new message reply markup; for bots only
         - Parameter location: New location content of the message; may be null. Pass null to stop sharing the live location
         */
        public init(chatId: Int64, messageId: Int64, replyMarkup: TDEnum.ReplyMarkup, location: TDObject.Location) {
            self.chatId = chatId
            self.messageId = messageId
            self.replyMarkup = replyMarkup
            self.location = location
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            messageId = try container.decodeInt64(forKey: .init(string: "messageId"))
            replyMarkup = try container.decode(TDEnum.ReplyMarkup.self, forKey: .init(string: "replyMarkup"))
            location = try container.decode(TDObject.Location.self, forKey: .init(string: "location"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encodeInt64(messageId, forKey: .init(string: "messageId"))
            try container.encode(replyMarkup, forKey: .init(string: "replyMarkup"))
            try container.encode(location, forKey: .init(string: "location"))
        }
    }
}
