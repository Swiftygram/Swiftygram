//
//  Message.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Describes a message
     */
    struct Message: TDObjectProtocol {
        /**
         Message identifier, unique for the chat to which the message belongs
         */
        public let id: Int64

        /**
         Identifier of the user who sent the message; 0 if unknown. It is unknown for channel posts
         */
        public let senderUserId: Int

        /**
         Chat identifier
         */
        public let chatId: Int64

        /**
         Information about the sending state of the message; may be null
         */
        public let sendingState: TDEnum.MessageSendingState

        /**
         True, if the message is outgoing
         */
        public let isOutgoing: Bool

        /**
         True, if the message can be edited. For live location and poll messages this fields shows, whether editMessageLiveLocation or stopPoll can be used with this message by the client
         */
        public let canBeEdited: Bool

        /**
         True, if the message can be forwarded
         */
        public let canBeForwarded: Bool

        /**
         True, if the message can be deleted only for the current user while other users will continue to see it
         */
        public let canBeDeletedOnlyForSelf: Bool

        /**
         True, if the message can be deleted for all users
         */
        public let canBeDeletedForAllUsers: Bool

        /**
         True, if the message is a channel post. All messages to channels are channel posts, all other messages are not channel posts
         */
        public let isChannelPost: Bool

        /**
         True, if the message contains an unread mention for the current user
         */
        public let containsUnreadMention: Bool

        /**
         Point in time (Unix timestamp) when the message was sent
         */
        public let date: Foundation.Date

        /**
         Point in time (Unix timestamp) when the message was last edited
         */
        public let editDate: Foundation.Date

        /**
         Information about the initial message sender; may be null
         */
        public let forwardInfo: TDObject.MessageForwardInfo

        /**
         If non-zero, the identifier of the message this message is replying to; can be the identifier of a deleted message
         */
        public let replyToMessageId: Int64

        /**
         For self-destructing messages, the message's TTL (Time To Live), in seconds; 0 if none. TDLib will send updateDeleteMessages or updateMessageContent once the TTL expires
         */
        public let ttl: Int

        /**
         Time left before the message expires, in seconds
         */
        public let ttlExpiresIn: Double

        /**
         If non-zero, the user identifier of the bot through which this message was sent
         */
        public let viaBotUserId: Int

        /**
         For channel posts, optional author signature
         */
        public let authorSignature: String

        /**
         Number of times this message was viewed
         */
        public let views: Int

        /**
         Unique identifier of an album this message belongs to. Only photos and videos can be grouped together in albums
         */
        public let mediaAlbumId: Int64

        /**
         Content of the message
         */
        public let content: TDEnum.MessageContent

        /**
         Reply markup for the message; may be null
         */
        public let replyMarkup: TDEnum.ReplyMarkup

        /**
         Describes a message

         - Parameter id: Message identifier, unique for the chat to which the message belongs
         - Parameter senderUserId: Identifier of the user who sent the message; 0 if unknown. It is unknown for channel posts
         - Parameter chatId: Chat identifier
         - Parameter sendingState: Information about the sending state of the message; may be null
         - Parameter isOutgoing: True, if the message is outgoing
         - Parameter canBeEdited: True, if the message can be edited. For live location and poll messages this fields shows, whether editMessageLiveLocation or stopPoll can be used with this message by the client
         - Parameter canBeForwarded: True, if the message can be forwarded
         - Parameter canBeDeletedOnlyForSelf: True, if the message can be deleted only for the current user while other users will continue to see it
         - Parameter canBeDeletedForAllUsers: True, if the message can be deleted for all users
         - Parameter isChannelPost: True, if the message is a channel post. All messages to channels are channel posts, all other messages are not channel posts
         - Parameter containsUnreadMention: True, if the message contains an unread mention for the current user
         - Parameter date: Point in time (Unix timestamp) when the message was sent
         - Parameter editDate: Point in time (Unix timestamp) when the message was last edited
         - Parameter forwardInfo: Information about the initial message sender; may be null
         - Parameter replyToMessageId: If non-zero, the identifier of the message this message is replying to; can be the identifier of a deleted message
         - Parameter ttl: For self-destructing messages, the message's TTL (Time To Live), in seconds; 0 if none. TDLib will send updateDeleteMessages or updateMessageContent once the TTL expires
         - Parameter ttlExpiresIn: Time left before the message expires, in seconds
         - Parameter viaBotUserId: If non-zero, the user identifier of the bot through which this message was sent
         - Parameter authorSignature: For channel posts, optional author signature
         - Parameter views: Number of times this message was viewed
         - Parameter mediaAlbumId: Unique identifier of an album this message belongs to. Only photos and videos can be grouped together in albums
         - Parameter content: Content of the message
         - Parameter replyMarkup: Reply markup for the message; may be null
         */
        public init(id: Int64, senderUserId: Int, chatId: Int64, sendingState: TDEnum.MessageSendingState, isOutgoing: Bool, canBeEdited: Bool, canBeForwarded: Bool, canBeDeletedOnlyForSelf: Bool, canBeDeletedForAllUsers: Bool, isChannelPost: Bool, containsUnreadMention: Bool, date: Foundation.Date, editDate: Foundation.Date, forwardInfo: TDObject.MessageForwardInfo, replyToMessageId: Int64, ttl: Int, ttlExpiresIn: Double, viaBotUserId: Int, authorSignature: String, views: Int, mediaAlbumId: Int64, content: TDEnum.MessageContent, replyMarkup: TDEnum.ReplyMarkup) {
            self.id = id
            self.senderUserId = senderUserId
            self.chatId = chatId
            self.sendingState = sendingState
            self.isOutgoing = isOutgoing
            self.canBeEdited = canBeEdited
            self.canBeForwarded = canBeForwarded
            self.canBeDeletedOnlyForSelf = canBeDeletedOnlyForSelf
            self.canBeDeletedForAllUsers = canBeDeletedForAllUsers
            self.isChannelPost = isChannelPost
            self.containsUnreadMention = containsUnreadMention
            self.date = date
            self.editDate = editDate
            self.forwardInfo = forwardInfo
            self.replyToMessageId = replyToMessageId
            self.ttl = ttl
            self.ttlExpiresIn = ttlExpiresIn
            self.viaBotUserId = viaBotUserId
            self.authorSignature = authorSignature
            self.views = views
            self.mediaAlbumId = mediaAlbumId
            self.content = content
            self.replyMarkup = replyMarkup
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            id = try container.decodeInt64(forKey: .init(string: "id"))
            senderUserId = try container.decode(Int.self, forKey: .init(string: "senderUserId"))
            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            sendingState = try container.decode(TDEnum.MessageSendingState.self, forKey: .init(string: "sendingState"))
            isOutgoing = try container.decode(Bool.self, forKey: .init(string: "isOutgoing"))
            canBeEdited = try container.decode(Bool.self, forKey: .init(string: "canBeEdited"))
            canBeForwarded = try container.decode(Bool.self, forKey: .init(string: "canBeForwarded"))
            canBeDeletedOnlyForSelf = try container.decode(Bool.self, forKey: .init(string: "canBeDeletedOnlyForSelf"))
            canBeDeletedForAllUsers = try container.decode(Bool.self, forKey: .init(string: "canBeDeletedForAllUsers"))
            isChannelPost = try container.decode(Bool.self, forKey: .init(string: "isChannelPost"))
            containsUnreadMention = try container.decode(Bool.self, forKey: .init(string: "containsUnreadMention"))
            date = try container.decodeDate(forKey: .init(string: "date"))
            editDate = try container.decodeDate(forKey: .init(string: "editDate"))
            forwardInfo = try container.decode(TDObject.MessageForwardInfo.self, forKey: .init(string: "forwardInfo"))
            replyToMessageId = try container.decodeInt64(forKey: .init(string: "replyToMessageId"))
            ttl = try container.decode(Int.self, forKey: .init(string: "ttl"))
            ttlExpiresIn = try container.decode(Double.self, forKey: .init(string: "ttlExpiresIn"))
            viaBotUserId = try container.decode(Int.self, forKey: .init(string: "viaBotUserId"))
            authorSignature = try container.decode(String.self, forKey: .init(string: "authorSignature"))
            views = try container.decode(Int.self, forKey: .init(string: "views"))
            mediaAlbumId = try container.decodeInt64(forKey: .init(string: "mediaAlbumId"))
            content = try container.decode(TDEnum.MessageContent.self, forKey: .init(string: "content"))
            replyMarkup = try container.decode(TDEnum.ReplyMarkup.self, forKey: .init(string: "replyMarkup"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(id, forKey: .init(string: "id"))
            try container.encode(senderUserId, forKey: .init(string: "senderUserId"))
            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encode(sendingState, forKey: .init(string: "sendingState"))
            try container.encode(isOutgoing, forKey: .init(string: "isOutgoing"))
            try container.encode(canBeEdited, forKey: .init(string: "canBeEdited"))
            try container.encode(canBeForwarded, forKey: .init(string: "canBeForwarded"))
            try container.encode(canBeDeletedOnlyForSelf, forKey: .init(string: "canBeDeletedOnlyForSelf"))
            try container.encode(canBeDeletedForAllUsers, forKey: .init(string: "canBeDeletedForAllUsers"))
            try container.encode(isChannelPost, forKey: .init(string: "isChannelPost"))
            try container.encode(containsUnreadMention, forKey: .init(string: "containsUnreadMention"))
            try container.encodeDate(date, forKey: .init(string: "date"))
            try container.encodeDate(editDate, forKey: .init(string: "editDate"))
            try container.encode(forwardInfo, forKey: .init(string: "forwardInfo"))
            try container.encodeInt64(replyToMessageId, forKey: .init(string: "replyToMessageId"))
            try container.encode(ttl, forKey: .init(string: "ttl"))
            try container.encode(ttlExpiresIn, forKey: .init(string: "ttlExpiresIn"))
            try container.encode(viaBotUserId, forKey: .init(string: "viaBotUserId"))
            try container.encode(authorSignature, forKey: .init(string: "authorSignature"))
            try container.encode(views, forKey: .init(string: "views"))
            try container.encodeInt64(mediaAlbumId, forKey: .init(string: "mediaAlbumId"))
            try container.encode(content, forKey: .init(string: "content"))
            try container.encode(replyMarkup, forKey: .init(string: "replyMarkup"))
        }
    }
}
