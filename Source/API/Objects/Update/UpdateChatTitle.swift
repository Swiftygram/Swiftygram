//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     The title of a chat was changed
     */
    struct UpdateChatTitle: TDObject.Update {
        /**
         Chat identifier
         */
        public var chatId: Int64

        /**
         The new chat title
         */
        public var title: String

        /**
         The title of a chat was changed

         - Parameter chatId: Chat identifier
         - Parameter title: The new chat title
         */
        public init(chatId: Int64, title: String) {
            self.chatId = chatId
            self.title = title
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            title = try container.decode(String.self, forKey: .init(string: "title"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encode(title, forKey: .init(string: "title"))
        }
    }
}
