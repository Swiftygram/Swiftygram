//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains information about a chat invite link
     */
    struct ChatInviteLinkInfo: TDObjectProtocol {
        /**
         Chat identifier of the invite link; 0 if the user is not a member of this chat
         */
        public var chatId: Int64

        /**
         Contains information about the type of the chat
         */
        public var type: TDEnum.ChatType

        /**
         Title of the chat
         */
        public var title: String

        /**
         Chat photo; may be null
         */
        public var photo: TDObject.ChatPhoto?

        /**
         Number of members
         */
        public var memberCount: Int

        /**
         User identifiers of some chat members that may be known to the current user
         */
        public var memberUserIds: [Int]

        /**
         True, if the chat is a public supergroup or channel with a username
         */
        public var isPublic: Bool

        /**
         Contains information about a chat invite link

         - Parameter chatId: Chat identifier of the invite link; 0 if the user is not a member of this chat
         - Parameter type: Contains information about the type of the chat
         - Parameter title: Title of the chat
         - Parameter photo: Chat photo; may be null
         - Parameter memberCount: Number of members
         - Parameter memberUserIds: User identifiers of some chat members that may be known to the current user
         - Parameter isPublic: True, if the chat is a public supergroup or channel with a username
         */
        public init(chatId: Int64, type: TDEnum.ChatType, title: String, photo: TDObject.ChatPhoto?, memberCount: Int, memberUserIds: [Int], isPublic: Bool) {
            self.chatId = chatId
            self.type = type
            self.title = title
            self.photo = photo
            self.memberCount = memberCount
            self.memberUserIds = memberUserIds
            self.isPublic = isPublic
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            type = try container.decode(TDEnum.ChatType.self, forKey: .init(string: "type"))
            title = try container.decode(String.self, forKey: .init(string: "title"))
            photo = try container.decodeIfPresent(TDObject.ChatPhoto.self, forKey: .init(string: "photo"))
            memberCount = try container.decode(Int.self, forKey: .init(string: "memberCount"))
            memberUserIds = try container.decode([Int].self, forKey: .init(string: "memberUserIds"))
            isPublic = try container.decode(Bool.self, forKey: .init(string: "isPublic"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encode(type, forKey: .init(string: "type"))
            try container.encode(title, forKey: .init(string: "title"))
            try container.encodeIfPresent(photo, forKey: .init(string: "photo"))
            try container.encode(memberCount, forKey: .init(string: "memberCount"))
            try container.encode(memberUserIds, forKey: .init(string: "memberUserIds"))
            try container.encode(isPublic, forKey: .init(string: "isPublic"))
        }
    }
}
