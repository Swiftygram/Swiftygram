//
//  GetPublicMessageLink.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns a public HTTPS link to a message. Available only for messages in public supergroups and channels

     - ReturnType: `TDObject.PublicMessageLink`
     */
    struct GetPublicMessageLink: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.PublicMessageLink

        /**
         Identifier of the chat to which the message belongs
         */
        public var chatId: Int64

        /**
         Identifier of the message
         */
        public var messageId: Int64

        /**
         Pass true if a link for a whole media album should be returned
         */
        public var forAlbum: Bool

        /**
         Returns a public HTTPS link to a message. Available only for messages in public supergroups and channels

         - Parameter chatId: Identifier of the chat to which the message belongs
         - Parameter messageId: Identifier of the message
         - Parameter forAlbum: Pass true if a link for a whole media album should be returned
         */
        public init(chatId: Int64, messageId: Int64, forAlbum: Bool) {
            self.chatId = chatId
            self.messageId = messageId
            self.forAlbum = forAlbum
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            messageId = try container.decodeInt64(forKey: .init(string: "messageId"))
            forAlbum = try container.decode(Bool.self, forKey: .init(string: "forAlbum"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encodeInt64(messageId, forKey: .init(string: "messageId"))
            try container.encode(forAlbum, forKey: .init(string: "forAlbum"))
        }
    }
}
