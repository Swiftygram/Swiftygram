//
//  UpdateChatIsPinned.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     A chat was pinned or unpinned
     */
    struct UpdateChatIsPinned: TDObject.Update {
        /**
         Chat identifier
         */
        public var chatId: Int64

        /**
         New value of is_pinned
         */
        public var isPinned: Bool

        /**
         New value of the chat order
         */
        public var order: Int64

        /**
         A chat was pinned or unpinned

         - Parameter chatId: Chat identifier
         - Parameter isPinned: New value of is_pinned
         - Parameter order: New value of the chat order
         */
        public init(chatId: Int64, isPinned: Bool, order: Int64) {
            self.chatId = chatId
            self.isPinned = isPinned
            self.order = order
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            isPinned = try container.decode(Bool.self, forKey: .init(string: "isPinned"))
            order = try container.decodeInt64(forKey: .init(string: "order"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encode(isPinned, forKey: .init(string: "isPinned"))
            try container.encodeInt64(order, forKey: .init(string: "order"))
        }
    }
}
