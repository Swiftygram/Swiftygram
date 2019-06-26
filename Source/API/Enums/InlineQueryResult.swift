//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDEnum {
    /**
     Represents a single result of an inline query
     */
    enum InlineQueryResult: TDEnumProtocol {
        /**
         Represents a link to an article or web page

         - id: Unique identifier of the query result
         - url: URL of the result, if it exists
         - hideUrl: True, if the URL must be not shown
         - title: Title of the result
         - description: A short description of the result
         - thumbnail: Result thumbnail; may be null
         */
        case article(id: String, url: URL, hideUrl: Bool, title: String, description: String, thumbnail: TDObject.PhotoSize?)

        /**
         Represents a user contact

         - id: Unique identifier of the query result
         - contact: A user contact
         - thumbnail: Result thumbnail; may be null
         */
        case contact(id: String, contact: TDObject.Contact, thumbnail: TDObject.PhotoSize?)

        /**
         Represents a point on the map

         - id: Unique identifier of the query result
         - location: Location result
         - title: Title of the result
         - thumbnail: Result thumbnail; may be null
         */
        case location(id: String, location: TDObject.Location, title: String, thumbnail: TDObject.PhotoSize?)

        /**
         Represents information about a venue

         - id: Unique identifier of the query result
         - venue: Venue result
         - thumbnail: Result thumbnail; may be null
         */
        case venue(id: String, venue: TDObject.Venue, thumbnail: TDObject.PhotoSize?)

        /**
         Represents information about a game

         - id: Unique identifier of the query result
         - game: Game result
         */
        case game(id: String, game: TDObject.Game)

        /**
         Represents an animation file

         - id: Unique identifier of the query result
         - animation: Animation file
         - title: Animation title
         */
        case animation(id: String, animation: TDObject.Animation, title: String)

        /**
         Represents an audio file

         - id: Unique identifier of the query result
         - audio: Audio file
         */
        case audio(id: String, audio: TDObject.Audio)

        /**
         Represents a document

         - id: Unique identifier of the query result
         - document: Document
         - title: Document title
         - description: Document description
         */
        case document(id: String, document: TDObject.Document, title: String, description: String)

        /**
         Represents a photo

         - id: Unique identifier of the query result
         - photo: Photo
         - title: Title of the result, if known
         - description: A short description of the result, if known
         */
        case photo(id: String, photo: TDObject.Photo, title: String, description: String)

        /**
         Represents a sticker

         - id: Unique identifier of the query result
         - sticker: Sticker
         */
        case sticker(id: String, sticker: TDObject.Sticker)

        /**
         Represents a video

         - id: Unique identifier of the query result
         - video: Video
         - title: Title of the video
         - description: Description of the video
         */
        case video(id: String, video: TDObject.Video, title: String, description: String)

        /**
         Represents a voice note

         - id: Unique identifier of the query result
         - voiceNote: Voice note
         - title: Title of the voice note
         */
        case voiceNote(id: String, voiceNote: TDObject.VoiceNote, title: String)

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let type = try container.decode(String.self, forKey: .type)

            switch type {
            case "inlineQueryResultArticle":
                let id = try container.decode(String.self, forKey: .init(string: "id"))
                let url = try container.decode(URL.self, forKey: .init(string: "url"))
                let hideUrl = try container.decode(Bool.self, forKey: .init(string: "hideUrl"))
                let title = try container.decode(String.self, forKey: .init(string: "title"))
                let description = try container.decode(String.self, forKey: .init(string: "description"))
                let thumbnail = try container.decodeIfPresent(TDObject.PhotoSize.self, forKey: .init(string: "thumbnail"))

                self = .article(id: id, url: url, hideUrl: hideUrl, title: title, description: description, thumbnail: thumbnail)

            case "inlineQueryResultContact":
                let id = try container.decode(String.self, forKey: .init(string: "id"))
                let contact = try container.decode(TDObject.Contact.self, forKey: .init(string: "contact"))
                let thumbnail = try container.decodeIfPresent(TDObject.PhotoSize.self, forKey: .init(string: "thumbnail"))

                self = .contact(id: id, contact: contact, thumbnail: thumbnail)

            case "inlineQueryResultLocation":
                let id = try container.decode(String.self, forKey: .init(string: "id"))
                let location = try container.decode(TDObject.Location.self, forKey: .init(string: "location"))
                let title = try container.decode(String.self, forKey: .init(string: "title"))
                let thumbnail = try container.decodeIfPresent(TDObject.PhotoSize.self, forKey: .init(string: "thumbnail"))

                self = .location(id: id, location: location, title: title, thumbnail: thumbnail)

            case "inlineQueryResultVenue":
                let id = try container.decode(String.self, forKey: .init(string: "id"))
                let venue = try container.decode(TDObject.Venue.self, forKey: .init(string: "venue"))
                let thumbnail = try container.decodeIfPresent(TDObject.PhotoSize.self, forKey: .init(string: "thumbnail"))

                self = .venue(id: id, venue: venue, thumbnail: thumbnail)

            case "inlineQueryResultGame":
                let id = try container.decode(String.self, forKey: .init(string: "id"))
                let game = try container.decode(TDObject.Game.self, forKey: .init(string: "game"))

                self = .game(id: id, game: game)

            case "inlineQueryResultAnimation":
                let id = try container.decode(String.self, forKey: .init(string: "id"))
                let animation = try container.decode(TDObject.Animation.self, forKey: .init(string: "animation"))
                let title = try container.decode(String.self, forKey: .init(string: "title"))

                self = .animation(id: id, animation: animation, title: title)

            case "inlineQueryResultAudio":
                let id = try container.decode(String.self, forKey: .init(string: "id"))
                let audio = try container.decode(TDObject.Audio.self, forKey: .init(string: "audio"))

                self = .audio(id: id, audio: audio)

            case "inlineQueryResultDocument":
                let id = try container.decode(String.self, forKey: .init(string: "id"))
                let document = try container.decode(TDObject.Document.self, forKey: .init(string: "document"))
                let title = try container.decode(String.self, forKey: .init(string: "title"))
                let description = try container.decode(String.self, forKey: .init(string: "description"))

                self = .document(id: id, document: document, title: title, description: description)

            case "inlineQueryResultPhoto":
                let id = try container.decode(String.self, forKey: .init(string: "id"))
                let photo = try container.decode(TDObject.Photo.self, forKey: .init(string: "photo"))
                let title = try container.decode(String.self, forKey: .init(string: "title"))
                let description = try container.decode(String.self, forKey: .init(string: "description"))

                self = .photo(id: id, photo: photo, title: title, description: description)

            case "inlineQueryResultSticker":
                let id = try container.decode(String.self, forKey: .init(string: "id"))
                let sticker = try container.decode(TDObject.Sticker.self, forKey: .init(string: "sticker"))

                self = .sticker(id: id, sticker: sticker)

            case "inlineQueryResultVideo":
                let id = try container.decode(String.self, forKey: .init(string: "id"))
                let video = try container.decode(TDObject.Video.self, forKey: .init(string: "video"))
                let title = try container.decode(String.self, forKey: .init(string: "title"))
                let description = try container.decode(String.self, forKey: .init(string: "description"))

                self = .video(id: id, video: video, title: title, description: description)

            case "inlineQueryResultVoiceNote":
                let id = try container.decode(String.self, forKey: .init(string: "id"))
                let voiceNote = try container.decode(TDObject.VoiceNote.self, forKey: .init(string: "voiceNote"))
                let title = try container.decode(String.self, forKey: .init(string: "title"))

                self = .voiceNote(id: id, voiceNote: voiceNote, title: title)

            default:
                throw DecodingError.typeMismatch(InlineQueryResult.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined InlineQueryResult"))
            }
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            switch self {
            case let .article(id, url, hideUrl, title, description, thumbnail):
                try container.encode("inlineQueryResultArticle", forKey: .type)

                try container.encode(id, forKey: .init(string: "id"))
                try container.encode(url, forKey: .init(string: "url"))
                try container.encode(hideUrl, forKey: .init(string: "hideUrl"))
                try container.encode(title, forKey: .init(string: "title"))
                try container.encode(description, forKey: .init(string: "description"))
                try container.encodeIfPresent(thumbnail, forKey: .init(string: "thumbnail"))

            case let .contact(id, contact, thumbnail):
                try container.encode("inlineQueryResultContact", forKey: .type)

                try container.encode(id, forKey: .init(string: "id"))
                try container.encode(contact, forKey: .init(string: "contact"))
                try container.encodeIfPresent(thumbnail, forKey: .init(string: "thumbnail"))

            case let .location(id, location, title, thumbnail):
                try container.encode("inlineQueryResultLocation", forKey: .type)

                try container.encode(id, forKey: .init(string: "id"))
                try container.encode(location, forKey: .init(string: "location"))
                try container.encode(title, forKey: .init(string: "title"))
                try container.encodeIfPresent(thumbnail, forKey: .init(string: "thumbnail"))

            case let .venue(id, venue, thumbnail):
                try container.encode("inlineQueryResultVenue", forKey: .type)

                try container.encode(id, forKey: .init(string: "id"))
                try container.encode(venue, forKey: .init(string: "venue"))
                try container.encodeIfPresent(thumbnail, forKey: .init(string: "thumbnail"))

            case let .game(id, game):
                try container.encode("inlineQueryResultGame", forKey: .type)

                try container.encode(id, forKey: .init(string: "id"))
                try container.encode(game, forKey: .init(string: "game"))

            case let .animation(id, animation, title):
                try container.encode("inlineQueryResultAnimation", forKey: .type)

                try container.encode(id, forKey: .init(string: "id"))
                try container.encode(animation, forKey: .init(string: "animation"))
                try container.encode(title, forKey: .init(string: "title"))

            case let .audio(id, audio):
                try container.encode("inlineQueryResultAudio", forKey: .type)

                try container.encode(id, forKey: .init(string: "id"))
                try container.encode(audio, forKey: .init(string: "audio"))

            case let .document(id, document, title, description):
                try container.encode("inlineQueryResultDocument", forKey: .type)

                try container.encode(id, forKey: .init(string: "id"))
                try container.encode(document, forKey: .init(string: "document"))
                try container.encode(title, forKey: .init(string: "title"))
                try container.encode(description, forKey: .init(string: "description"))

            case let .photo(id, photo, title, description):
                try container.encode("inlineQueryResultPhoto", forKey: .type)

                try container.encode(id, forKey: .init(string: "id"))
                try container.encode(photo, forKey: .init(string: "photo"))
                try container.encode(title, forKey: .init(string: "title"))
                try container.encode(description, forKey: .init(string: "description"))

            case let .sticker(id, sticker):
                try container.encode("inlineQueryResultSticker", forKey: .type)

                try container.encode(id, forKey: .init(string: "id"))
                try container.encode(sticker, forKey: .init(string: "sticker"))

            case let .video(id, video, title, description):
                try container.encode("inlineQueryResultVideo", forKey: .type)

                try container.encode(id, forKey: .init(string: "id"))
                try container.encode(video, forKey: .init(string: "video"))
                try container.encode(title, forKey: .init(string: "title"))
                try container.encode(description, forKey: .init(string: "description"))

            case let .voiceNote(id, voiceNote, title):
                try container.encode("inlineQueryResultVoiceNote", forKey: .type)

                try container.encode(id, forKey: .init(string: "id"))
                try container.encode(voiceNote, forKey: .init(string: "voiceNote"))
                try container.encode(title, forKey: .init(string: "title"))
            }
        }
    }
}
