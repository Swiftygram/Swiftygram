//
//  UpdateChatPhoto.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     A chat photo was changed
     */
    struct UpdateChatPhoto: TDObject.Update {
        /**
         Chat identifier
         */
        public var chatId: Int64

        /**
         The new chat photo; may be null
         */
        public var photo: TDObject.ChatPhoto?

        /**
         A chat photo was changed

         - Parameter chatId: Chat identifier
         - Parameter photo: The new chat photo; may be null
         */
        public init(chatId: Int64, photo: TDObject.ChatPhoto?) {
            self.chatId = chatId
            self.photo = photo
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            photo = try container.decodeIfPresent(TDObject.ChatPhoto.self, forKey: .init(string: "photo"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encodeIfPresent(photo, forKey: .init(string: "photo"))
        }
    }
}
