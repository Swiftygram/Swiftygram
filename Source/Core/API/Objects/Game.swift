//
//  Game.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Describes a game
     */
    struct Game: TDObjectProtocol {
        /**
         Game ID
         */
        public var id: Int64

        /**
         Game short name. To share a game use the URL https://t.me/{bot_username}?game={game_short_name}
         */
        public var shortName: String

        /**
         Game title
         */
        public var title: String

        /**
         Game text, usually containing scoreboards for a game
         */
        public var text: TDObject.FormattedText

        /**
         Game description
         */
        public var description: String

        /**
         Game photo
         */
        public var photo: TDObject.Photo

        /**
         Game animation; may be null
         */
        public var animation: TDObject.Animation?

        /**
         Describes a game

         - Parameter id: Game ID
         - Parameter shortName: Game short name. To share a game use the URL https://t.me/{bot_username}?game={game_short_name}
         - Parameter title: Game title
         - Parameter text: Game text, usually containing scoreboards for a game
         - Parameter description: Game description
         - Parameter photo: Game photo
         - Parameter animation: Game animation; may be null
         */
        public init(id: Int64, shortName: String, title: String, text: TDObject.FormattedText, description: String, photo: TDObject.Photo, animation: TDObject.Animation?) {
            self.id = id
            self.shortName = shortName
            self.title = title
            self.text = text
            self.description = description
            self.photo = photo
            self.animation = animation
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            id = try container.decodeInt64(forKey: .init(string: "id"))
            shortName = try container.decode(String.self, forKey: .init(string: "shortName"))
            title = try container.decode(String.self, forKey: .init(string: "title"))
            text = try container.decode(TDObject.FormattedText.self, forKey: .init(string: "text"))
            description = try container.decode(String.self, forKey: .init(string: "description"))
            photo = try container.decode(TDObject.Photo.self, forKey: .init(string: "photo"))
            animation = try container.decodeIfPresent(TDObject.Animation.self, forKey: .init(string: "animation"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(id, forKey: .init(string: "id"))
            try container.encode(shortName, forKey: .init(string: "shortName"))
            try container.encode(title, forKey: .init(string: "title"))
            try container.encode(text, forKey: .init(string: "text"))
            try container.encode(description, forKey: .init(string: "description"))
            try container.encode(photo, forKey: .init(string: "photo"))
            try container.encodeIfPresent(animation, forKey: .init(string: "animation"))
        }
    }
}
