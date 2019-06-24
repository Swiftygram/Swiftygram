//
//  SearchMessagesFilter.swift
//  Swiftygram
//  Created by ky1vstar on 6/24/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDEnum {
    enum SearchMessagesFilter: TDEnumProtocol {
        ///  Returns all found messages, no filter is applied
        case empty

        ///  Returns only animation messages
        case animation

        ///  Returns only audio messages
        case audio

        ///  Returns only document messages
        case document

        ///  Returns only photo messages
        case photo

        ///  Returns only video messages
        case video

        ///  Returns only voice note messages
        case voiceNote

        ///  Returns only photo and video messages
        case photoAndVideo

        ///  Returns only messages containing URLs
        case url

        ///  Returns only messages containing chat photos
        case chatPhoto

        ///  Returns only call messages
        case call

        ///  Returns only incoming call messages with missed/declined discard
        /// reasons
        case missedCall

        ///  Returns only video note messages
        case videoNote

        ///  Returns only voice and video note messages
        case voiceAndVideoNote

        ///  Returns only messages with mentions of the current user, or messages
        /// that are replies to their messages
        case mention

        ///  Returns only messages with unread mentions of the current user, or
        /// messages that are replies to their messages. When using this filter
        /// the results can't be additionally filtered by a query or by the
        /// sending user
        case unreadMention

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let type = try container.decode(String.self, forKey: .type)

            switch type {
            case "searchMessagesFilterEmpty":
                self = .empty

            case "searchMessagesFilterAnimation":
                self = .animation

            case "searchMessagesFilterAudio":
                self = .audio

            case "searchMessagesFilterDocument":
                self = .document

            case "searchMessagesFilterPhoto":
                self = .photo

            case "searchMessagesFilterVideo":
                self = .video

            case "searchMessagesFilterVoiceNote":
                self = .voiceNote

            case "searchMessagesFilterPhotoAndVideo":
                self = .photoAndVideo

            case "searchMessagesFilterUrl":
                self = .url

            case "searchMessagesFilterChatPhoto":
                self = .chatPhoto

            case "searchMessagesFilterCall":
                self = .call

            case "searchMessagesFilterMissedCall":
                self = .missedCall

            case "searchMessagesFilterVideoNote":
                self = .videoNote

            case "searchMessagesFilterVoiceAndVideoNote":
                self = .voiceAndVideoNote

            case "searchMessagesFilterMention":
                self = .mention

            case "searchMessagesFilterUnreadMention":
                self = .unreadMention

            default:
                throw DecodingError.typeMismatch(SearchMessagesFilter.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined SearchMessagesFilter"))
            }
        }

        // MARK: - Decodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            switch self {
            case .empty:
                try container.encode("searchMessagesFilterEmpty", forKey: .type)

            case .animation:
                try container.encode("searchMessagesFilterAnimation", forKey: .type)

            case .audio:
                try container.encode("searchMessagesFilterAudio", forKey: .type)

            case .document:
                try container.encode("searchMessagesFilterDocument", forKey: .type)

            case .photo:
                try container.encode("searchMessagesFilterPhoto", forKey: .type)

            case .video:
                try container.encode("searchMessagesFilterVideo", forKey: .type)

            case .voiceNote:
                try container.encode("searchMessagesFilterVoiceNote", forKey: .type)

            case .photoAndVideo:
                try container.encode("searchMessagesFilterPhotoAndVideo", forKey: .type)

            case .url:
                try container.encode("searchMessagesFilterUrl", forKey: .type)

            case .chatPhoto:
                try container.encode("searchMessagesFilterChatPhoto", forKey: .type)

            case .call:
                try container.encode("searchMessagesFilterCall", forKey: .type)

            case .missedCall:
                try container.encode("searchMessagesFilterMissedCall", forKey: .type)

            case .videoNote:
                try container.encode("searchMessagesFilterVideoNote", forKey: .type)

            case .voiceAndVideoNote:
                try container.encode("searchMessagesFilterVoiceAndVideoNote", forKey: .type)

            case .mention:
                try container.encode("searchMessagesFilterMention", forKey: .type)

            case .unreadMention:
                try container.encode("searchMessagesFilterUnreadMention", forKey: .type)
            }
        }
    }
}
