//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Changes the status of a chat member, needs appropriate privileges. This function is currently not suitable for adding new members to the chat; instead, use addChatMember. The chat member status will not be changed until it has been synchronized with the server

     - ReturnType: `TDObject.Ok`
     */
    struct SetChatMemberStatus: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Chat identifier
         */
        public var chatId: Int64

        /**
         User identifier
         */
        public var userId: Int

        /**
         The new status of the member in the chat
         */
        public var status: TDEnum.ChatMemberStatus

        /**
         Changes the status of a chat member, needs appropriate privileges. This function is currently not suitable for adding new members to the chat; instead, use addChatMember. The chat member status will not be changed until it has been synchronized with the server

         - Parameter chatId: Chat identifier
         - Parameter userId: User identifier
         - Parameter status: The new status of the member in the chat
         */
        public init(chatId: Int64, userId: Int, status: TDEnum.ChatMemberStatus) {
            self.chatId = chatId
            self.userId = userId
            self.status = status
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            userId = try container.decode(Int.self, forKey: .init(string: "userId"))
            status = try container.decode(TDEnum.ChatMemberStatus.self, forKey: .init(string: "status"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encode(userId, forKey: .init(string: "userId"))
            try container.encode(status, forKey: .init(string: "status"))
        }
    }
}
