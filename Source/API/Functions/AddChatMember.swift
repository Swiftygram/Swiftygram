//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Adds a new member to a chat. Members can't be added to private or secret chats. Members will not be added until the chat state has been synchronized with the server

     - ReturnType: `TDObject.Ok`
     */
    struct AddChatMember: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Chat identifier
         */
        public var chatId: Int64

        /**
         Identifier of the user
         */
        public var userId: Int

        /**
         The number of earlier messages from the chat to be forwarded to the new member; up to 100. Ignored for supergroups and channels
         */
        public var forwardLimit: Int

        /**
         Adds a new member to a chat. Members can't be added to private or secret chats. Members will not be added until the chat state has been synchronized with the server

         - Parameter chatId: Chat identifier
         - Parameter userId: Identifier of the user
         - Parameter forwardLimit: The number of earlier messages from the chat to be forwarded to the new member; up to 100. Ignored for supergroups and channels
         */
        public init(chatId: Int64, userId: Int, forwardLimit: Int) {
            self.chatId = chatId
            self.userId = userId
            self.forwardLimit = forwardLimit
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            userId = try container.decode(Int.self, forKey: .init(string: "userId"))
            forwardLimit = try container.decode(Int.self, forKey: .init(string: "forwardLimit"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encode(userId, forKey: .init(string: "userId"))
            try container.encode(forwardLimit, forKey: .init(string: "forwardLimit"))
        }
    }
}
