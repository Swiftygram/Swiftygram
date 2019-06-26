//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     A chat was marked as unread or was read
     */
    struct UpdateChatIsMarkedAsUnread: TDObject.Update {
        /**
         Chat identifier
         */
        public var chatId: Int64

        /**
         New value of is_marked_as_unread
         */
        public var isMarkedAsUnread: Bool

        /**
         A chat was marked as unread or was read

         - Parameter chatId: Chat identifier
         - Parameter isMarkedAsUnread: New value of is_marked_as_unread
         */
        public init(chatId: Int64, isMarkedAsUnread: Bool) {
            self.chatId = chatId
            self.isMarkedAsUnread = isMarkedAsUnread
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            isMarkedAsUnread = try container.decode(Bool.self, forKey: .init(string: "isMarkedAsUnread"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encode(isMarkedAsUnread, forKey: .init(string: "isMarkedAsUnread"))
        }
    }
}
