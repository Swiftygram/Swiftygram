//
//  UpdateChatIsSponsored.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     A chat's is_sponsored field has changed
     */
    struct UpdateChatIsSponsored: TDObject.Update {
        /**
         Chat identifier
         */
        public var chatId: Int64

        /**
         New value of is_sponsored
         */
        public var isSponsored: Bool

        /**
         New value of chat order
         */
        public var order: Int64

        /**
         A chat's is_sponsored field has changed

         - Parameter chatId: Chat identifier
         - Parameter isSponsored: New value of is_sponsored
         - Parameter order: New value of chat order
         */
        public init(chatId: Int64, isSponsored: Bool, order: Int64) {
            self.chatId = chatId
            self.isSponsored = isSponsored
            self.order = order
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            isSponsored = try container.decode(Bool.self, forKey: .init(string: "isSponsored"))
            order = try container.decodeInt64(forKey: .init(string: "order"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encode(isSponsored, forKey: .init(string: "isSponsored"))
            try container.encodeInt64(order, forKey: .init(string: "order"))
        }
    }
}
