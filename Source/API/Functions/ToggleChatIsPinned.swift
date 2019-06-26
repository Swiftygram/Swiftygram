//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Changes the pinned state of a chat. You can pin up to GetOption("pinned_chat_count_max") non-secret chats and the same number of secret chats

     - ReturnType: `TDObject.Ok`
     */
    struct ToggleChatIsPinned: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Chat identifier
         */
        public var chatId: Int64

        /**
         New value of is_pinned
         */
        public var isPinned: Bool

        /**
         Changes the pinned state of a chat. You can pin up to GetOption("pinned_chat_count_max") non-secret chats and the same number of secret chats

         - Parameter chatId: Chat identifier
         - Parameter isPinned: New value of is_pinned
         */
        public init(chatId: Int64, isPinned: Bool) {
            self.chatId = chatId
            self.isPinned = isPinned
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            isPinned = try container.decode(Bool.self, forKey: .init(string: "isPinned"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encode(isPinned, forKey: .init(string: "isPinned"))
        }
    }
}
