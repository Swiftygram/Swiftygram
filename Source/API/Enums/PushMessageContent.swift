//
//  PushMessageContent.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDEnum {
    /**
     Contains content of a push message notification
     */
    enum PushMessageContent: TDEnumProtocol {
        /**
         A general message with hidden content

         - isPinned: True, if the message is a pinned message with the specified content
         */
        case hidden(isPinned: Bool)

        /**
         An animation message (GIF-style)

         - animation: Message content; may be null
         - caption: Animation caption
         - isPinned: True, if the message is a pinned message with the specified content
         */
        case animation(animation: TDObject.Animation, caption: String, isPinned: Bool)

        /**
         An audio message

         - audio: Message content; may be null
         - isPinned: True, if the message is a pinned message with the specified content
         */
        case audio(audio: TDObject.Audio, isPinned: Bool)

        /**
         A message with a user contact

         - name: Contact's name
         - isPinned: True, if the message is a pinned message with the specified content
         */
        case contact(name: String, isPinned: Bool)

        /**
         A contact has registered with Telegram
         */
        case contactRegistered

        /**
         A document message (a general file)

         - document: Message content; may be null
         - isPinned: True, if the message is a pinned message with the specified content
         */
        case document(document: TDObject.Document, isPinned: Bool)

        /**
         A message with a game

         - title: Game title, empty for pinned game message
         - isPinned: True, if the message is a pinned message with the specified content
         */
        case game(title: String, isPinned: Bool)

        /**
         A new high score was achieved in a game

         - title: Game title, empty for pinned message
         - score: New score, 0 for pinned message
         - isPinned: True, if the message is a pinned message with the specified content
         */
        case gameScore(title: String, score: Int, isPinned: Bool)

        /**
         A message with an invoice from a bot

         - price: Product price
         - isPinned: True, if the message is a pinned message with the specified content
         */
        case invoice(price: String, isPinned: Bool)

        /**
         A message with a location

         - isLive: True, if the location is live
         - isPinned: True, if the message is a pinned message with the specified content
         */
        case location(isLive: Bool, isPinned: Bool)

        /**
         A photo message

         - photo: Message content; may be null
         - caption: Photo caption
         - isSecret: True, if the photo is secret
         - isPinned: True, if the message is a pinned message with the specified content
         */
        case photo(photo: TDObject.Photo, caption: String, isSecret: Bool, isPinned: Bool)

        /**
         A message with a poll

         - question: Poll question
         - isPinned: True, if the message is a pinned message with the specified content
         */
        case poll(question: String, isPinned: Bool)

        /**
         A screenshot of a message in the chat has been taken
         */
        case screenshotTaken

        /**
         A message with a sticker

         - sticker: Message content; may be null
         - emoji: Emoji corresponding to the sticker; may be empty
         - isPinned: True, if the message is a pinned message with the specified content
         */
        case sticker(sticker: TDObject.Sticker, emoji: String, isPinned: Bool)

        /**
         A text message

         - text: Message text
         - isPinned: True, if the message is a pinned message with the specified content
         */
        case text(text: String, isPinned: Bool)

        /**
         A video message

         - video: Message content; may be null
         - caption: Video caption
         - isSecret: True, if the video is secret
         - isPinned: True, if the message is a pinned message with the specified content
         */
        case video(video: TDObject.Video, caption: String, isSecret: Bool, isPinned: Bool)

        /**
         A video note message

         - videoNote: Message content; may be null
         - isPinned: True, if the message is a pinned message with the specified content
         */
        case videoNote(videoNote: TDObject.VideoNote, isPinned: Bool)

        /**
         A voice note message

         - voiceNote: Message content; may be null
         - isPinned: True, if the message is a pinned message with the specified content
         */
        case voiceNote(voiceNote: TDObject.VoiceNote, isPinned: Bool)

        /**
         A newly created basic group
         */
        case basicGroupChatCreate

        /**
         New chat members were invited to a group

         - memberName: Name of the added member
         - isCurrentUser: True, if the current user was added to the group
         - isReturned: True, if the user has returned to the group himself
         */
        case chatAddMembers(memberName: String, isCurrentUser: Bool, isReturned: Bool)

        /**
         A chat photo was edited
         */
        case chatChangePhoto

        /**
         A chat title was edited

         - title: New chat title
         */
        case chatChangeTitle(title: String)

        /**
         A chat member was deleted

         - memberName: Name of the deleted member
         - isCurrentUser: True, if the current user was deleted from the group
         - isLeft: True, if the user has left the group himself
         */
        case chatDeleteMember(memberName: String, isCurrentUser: Bool, isLeft: Bool)

        /**
         A new member joined the chat by invite link
         */
        case chatJoinByLink

        /**
         A forwarded messages

         - totalCount: Number of forwarded messages
         */
        case messageForwards(totalCount: Int)

        /**
         A media album

         - totalCount: Number of messages in the album
         - hasPhotos: True, if the album has at least one photo
         - hasVideos: True, if the album has at least one video
         */
        case mediaAlbum(totalCount: Int, hasPhotos: Bool, hasVideos: Bool)

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let type = try container.decode(String.self, forKey: .type)

            switch type {
            case "pushMessageContentHidden":
                let isPinned = try container.decode(Bool.self, forKey: .init(string: "isPinned"))

                self = .hidden(isPinned: isPinned)

            case "pushMessageContentAnimation":
                let animation = try container.decode(TDObject.Animation.self, forKey: .init(string: "animation"))
                let caption = try container.decode(String.self, forKey: .init(string: "caption"))
                let isPinned = try container.decode(Bool.self, forKey: .init(string: "isPinned"))

                self = .animation(animation: animation, caption: caption, isPinned: isPinned)

            case "pushMessageContentAudio":
                let audio = try container.decode(TDObject.Audio.self, forKey: .init(string: "audio"))
                let isPinned = try container.decode(Bool.self, forKey: .init(string: "isPinned"))

                self = .audio(audio: audio, isPinned: isPinned)

            case "pushMessageContentContact":
                let name = try container.decode(String.self, forKey: .init(string: "name"))
                let isPinned = try container.decode(Bool.self, forKey: .init(string: "isPinned"))

                self = .contact(name: name, isPinned: isPinned)

            case "pushMessageContentContactRegistered":
                self = .contactRegistered

            case "pushMessageContentDocument":
                let document = try container.decode(TDObject.Document.self, forKey: .init(string: "document"))
                let isPinned = try container.decode(Bool.self, forKey: .init(string: "isPinned"))

                self = .document(document: document, isPinned: isPinned)

            case "pushMessageContentGame":
                let title = try container.decode(String.self, forKey: .init(string: "title"))
                let isPinned = try container.decode(Bool.self, forKey: .init(string: "isPinned"))

                self = .game(title: title, isPinned: isPinned)

            case "pushMessageContentGameScore":
                let title = try container.decode(String.self, forKey: .init(string: "title"))
                let score = try container.decode(Int.self, forKey: .init(string: "score"))
                let isPinned = try container.decode(Bool.self, forKey: .init(string: "isPinned"))

                self = .gameScore(title: title, score: score, isPinned: isPinned)

            case "pushMessageContentInvoice":
                let price = try container.decode(String.self, forKey: .init(string: "price"))
                let isPinned = try container.decode(Bool.self, forKey: .init(string: "isPinned"))

                self = .invoice(price: price, isPinned: isPinned)

            case "pushMessageContentLocation":
                let isLive = try container.decode(Bool.self, forKey: .init(string: "isLive"))
                let isPinned = try container.decode(Bool.self, forKey: .init(string: "isPinned"))

                self = .location(isLive: isLive, isPinned: isPinned)

            case "pushMessageContentPhoto":
                let photo = try container.decode(TDObject.Photo.self, forKey: .init(string: "photo"))
                let caption = try container.decode(String.self, forKey: .init(string: "caption"))
                let isSecret = try container.decode(Bool.self, forKey: .init(string: "isSecret"))
                let isPinned = try container.decode(Bool.self, forKey: .init(string: "isPinned"))

                self = .photo(photo: photo, caption: caption, isSecret: isSecret, isPinned: isPinned)

            case "pushMessageContentPoll":
                let question = try container.decode(String.self, forKey: .init(string: "question"))
                let isPinned = try container.decode(Bool.self, forKey: .init(string: "isPinned"))

                self = .poll(question: question, isPinned: isPinned)

            case "pushMessageContentScreenshotTaken":
                self = .screenshotTaken

            case "pushMessageContentSticker":
                let sticker = try container.decode(TDObject.Sticker.self, forKey: .init(string: "sticker"))
                let emoji = try container.decode(String.self, forKey: .init(string: "emoji"))
                let isPinned = try container.decode(Bool.self, forKey: .init(string: "isPinned"))

                self = .sticker(sticker: sticker, emoji: emoji, isPinned: isPinned)

            case "pushMessageContentText":
                let text = try container.decode(String.self, forKey: .init(string: "text"))
                let isPinned = try container.decode(Bool.self, forKey: .init(string: "isPinned"))

                self = .text(text: text, isPinned: isPinned)

            case "pushMessageContentVideo":
                let video = try container.decode(TDObject.Video.self, forKey: .init(string: "video"))
                let caption = try container.decode(String.self, forKey: .init(string: "caption"))
                let isSecret = try container.decode(Bool.self, forKey: .init(string: "isSecret"))
                let isPinned = try container.decode(Bool.self, forKey: .init(string: "isPinned"))

                self = .video(video: video, caption: caption, isSecret: isSecret, isPinned: isPinned)

            case "pushMessageContentVideoNote":
                let videoNote = try container.decode(TDObject.VideoNote.self, forKey: .init(string: "videoNote"))
                let isPinned = try container.decode(Bool.self, forKey: .init(string: "isPinned"))

                self = .videoNote(videoNote: videoNote, isPinned: isPinned)

            case "pushMessageContentVoiceNote":
                let voiceNote = try container.decode(TDObject.VoiceNote.self, forKey: .init(string: "voiceNote"))
                let isPinned = try container.decode(Bool.self, forKey: .init(string: "isPinned"))

                self = .voiceNote(voiceNote: voiceNote, isPinned: isPinned)

            case "pushMessageContentBasicGroupChatCreate":
                self = .basicGroupChatCreate

            case "pushMessageContentChatAddMembers":
                let memberName = try container.decode(String.self, forKey: .init(string: "memberName"))
                let isCurrentUser = try container.decode(Bool.self, forKey: .init(string: "isCurrentUser"))
                let isReturned = try container.decode(Bool.self, forKey: .init(string: "isReturned"))

                self = .chatAddMembers(memberName: memberName, isCurrentUser: isCurrentUser, isReturned: isReturned)

            case "pushMessageContentChatChangePhoto":
                self = .chatChangePhoto

            case "pushMessageContentChatChangeTitle":
                let title = try container.decode(String.self, forKey: .init(string: "title"))

                self = .chatChangeTitle(title: title)

            case "pushMessageContentChatDeleteMember":
                let memberName = try container.decode(String.self, forKey: .init(string: "memberName"))
                let isCurrentUser = try container.decode(Bool.self, forKey: .init(string: "isCurrentUser"))
                let isLeft = try container.decode(Bool.self, forKey: .init(string: "isLeft"))

                self = .chatDeleteMember(memberName: memberName, isCurrentUser: isCurrentUser, isLeft: isLeft)

            case "pushMessageContentChatJoinByLink":
                self = .chatJoinByLink

            case "pushMessageContentMessageForwards":
                let totalCount = try container.decode(Int.self, forKey: .init(string: "totalCount"))

                self = .messageForwards(totalCount: totalCount)

            case "pushMessageContentMediaAlbum":
                let totalCount = try container.decode(Int.self, forKey: .init(string: "totalCount"))
                let hasPhotos = try container.decode(Bool.self, forKey: .init(string: "hasPhotos"))
                let hasVideos = try container.decode(Bool.self, forKey: .init(string: "hasVideos"))

                self = .mediaAlbum(totalCount: totalCount, hasPhotos: hasPhotos, hasVideos: hasVideos)

            default:
                throw DecodingError.typeMismatch(PushMessageContent.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined PushMessageContent"))
            }
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            switch self {
            case let .hidden(isPinned):
                try container.encode("pushMessageContentHidden", forKey: .type)

                try container.encode(isPinned, forKey: .init(string: "isPinned"))

            case let .animation(animation, caption, isPinned):
                try container.encode("pushMessageContentAnimation", forKey: .type)

                try container.encode(animation, forKey: .init(string: "animation"))
                try container.encode(caption, forKey: .init(string: "caption"))
                try container.encode(isPinned, forKey: .init(string: "isPinned"))

            case let .audio(audio, isPinned):
                try container.encode("pushMessageContentAudio", forKey: .type)

                try container.encode(audio, forKey: .init(string: "audio"))
                try container.encode(isPinned, forKey: .init(string: "isPinned"))

            case let .contact(name, isPinned):
                try container.encode("pushMessageContentContact", forKey: .type)

                try container.encode(name, forKey: .init(string: "name"))
                try container.encode(isPinned, forKey: .init(string: "isPinned"))

            case .contactRegistered:
                try container.encode("pushMessageContentContactRegistered", forKey: .type)

            case let .document(document, isPinned):
                try container.encode("pushMessageContentDocument", forKey: .type)

                try container.encode(document, forKey: .init(string: "document"))
                try container.encode(isPinned, forKey: .init(string: "isPinned"))

            case let .game(title, isPinned):
                try container.encode("pushMessageContentGame", forKey: .type)

                try container.encode(title, forKey: .init(string: "title"))
                try container.encode(isPinned, forKey: .init(string: "isPinned"))

            case let .gameScore(title, score, isPinned):
                try container.encode("pushMessageContentGameScore", forKey: .type)

                try container.encode(title, forKey: .init(string: "title"))
                try container.encode(score, forKey: .init(string: "score"))
                try container.encode(isPinned, forKey: .init(string: "isPinned"))

            case let .invoice(price, isPinned):
                try container.encode("pushMessageContentInvoice", forKey: .type)

                try container.encode(price, forKey: .init(string: "price"))
                try container.encode(isPinned, forKey: .init(string: "isPinned"))

            case let .location(isLive, isPinned):
                try container.encode("pushMessageContentLocation", forKey: .type)

                try container.encode(isLive, forKey: .init(string: "isLive"))
                try container.encode(isPinned, forKey: .init(string: "isPinned"))

            case let .photo(photo, caption, isSecret, isPinned):
                try container.encode("pushMessageContentPhoto", forKey: .type)

                try container.encode(photo, forKey: .init(string: "photo"))
                try container.encode(caption, forKey: .init(string: "caption"))
                try container.encode(isSecret, forKey: .init(string: "isSecret"))
                try container.encode(isPinned, forKey: .init(string: "isPinned"))

            case let .poll(question, isPinned):
                try container.encode("pushMessageContentPoll", forKey: .type)

                try container.encode(question, forKey: .init(string: "question"))
                try container.encode(isPinned, forKey: .init(string: "isPinned"))

            case .screenshotTaken:
                try container.encode("pushMessageContentScreenshotTaken", forKey: .type)

            case let .sticker(sticker, emoji, isPinned):
                try container.encode("pushMessageContentSticker", forKey: .type)

                try container.encode(sticker, forKey: .init(string: "sticker"))
                try container.encode(emoji, forKey: .init(string: "emoji"))
                try container.encode(isPinned, forKey: .init(string: "isPinned"))

            case let .text(text, isPinned):
                try container.encode("pushMessageContentText", forKey: .type)

                try container.encode(text, forKey: .init(string: "text"))
                try container.encode(isPinned, forKey: .init(string: "isPinned"))

            case let .video(video, caption, isSecret, isPinned):
                try container.encode("pushMessageContentVideo", forKey: .type)

                try container.encode(video, forKey: .init(string: "video"))
                try container.encode(caption, forKey: .init(string: "caption"))
                try container.encode(isSecret, forKey: .init(string: "isSecret"))
                try container.encode(isPinned, forKey: .init(string: "isPinned"))

            case let .videoNote(videoNote, isPinned):
                try container.encode("pushMessageContentVideoNote", forKey: .type)

                try container.encode(videoNote, forKey: .init(string: "videoNote"))
                try container.encode(isPinned, forKey: .init(string: "isPinned"))

            case let .voiceNote(voiceNote, isPinned):
                try container.encode("pushMessageContentVoiceNote", forKey: .type)

                try container.encode(voiceNote, forKey: .init(string: "voiceNote"))
                try container.encode(isPinned, forKey: .init(string: "isPinned"))

            case .basicGroupChatCreate:
                try container.encode("pushMessageContentBasicGroupChatCreate", forKey: .type)

            case let .chatAddMembers(memberName, isCurrentUser, isReturned):
                try container.encode("pushMessageContentChatAddMembers", forKey: .type)

                try container.encode(memberName, forKey: .init(string: "memberName"))
                try container.encode(isCurrentUser, forKey: .init(string: "isCurrentUser"))
                try container.encode(isReturned, forKey: .init(string: "isReturned"))

            case .chatChangePhoto:
                try container.encode("pushMessageContentChatChangePhoto", forKey: .type)

            case let .chatChangeTitle(title):
                try container.encode("pushMessageContentChatChangeTitle", forKey: .type)

                try container.encode(title, forKey: .init(string: "title"))

            case let .chatDeleteMember(memberName, isCurrentUser, isLeft):
                try container.encode("pushMessageContentChatDeleteMember", forKey: .type)

                try container.encode(memberName, forKey: .init(string: "memberName"))
                try container.encode(isCurrentUser, forKey: .init(string: "isCurrentUser"))
                try container.encode(isLeft, forKey: .init(string: "isLeft"))

            case .chatJoinByLink:
                try container.encode("pushMessageContentChatJoinByLink", forKey: .type)

            case let .messageForwards(totalCount):
                try container.encode("pushMessageContentMessageForwards", forKey: .type)

                try container.encode(totalCount, forKey: .init(string: "totalCount"))

            case let .mediaAlbum(totalCount, hasPhotos, hasVideos):
                try container.encode("pushMessageContentMediaAlbum", forKey: .type)

                try container.encode(totalCount, forKey: .init(string: "totalCount"))
                try container.encode(hasPhotos, forKey: .init(string: "hasPhotos"))
                try container.encode(hasVideos, forKey: .init(string: "hasVideos"))
            }
        }
    }
}
