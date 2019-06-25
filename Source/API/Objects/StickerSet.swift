//
//  StickerSet.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Represents a sticker set
     */
    struct StickerSet: TDObjectProtocol {
        /**
         Identifier of the sticker set
         */
        public let id: Int64

        /**
         Title of the sticker set
         */
        public let title: String

        /**
         Name of the sticker set
         */
        public let name: String

        /**
         True, if the sticker set has been installed by the current user
         */
        public let isInstalled: Bool

        /**
         True, if the sticker set has been archived. A sticker set can't be installed and archived simultaneously
         */
        public let isArchived: Bool

        /**
         True, if the sticker set is official
         */
        public let isOfficial: Bool

        /**
         True, if the stickers in the set are masks
         */
        public let isMasks: Bool

        /**
         True for already viewed trending sticker sets
         */
        public let isViewed: Bool

        /**
         List of stickers in this set
         */
        public let stickers: [TDObject.Sticker]

        /**
         A list of emoji corresponding to the stickers in the same order
         */
        public let emojis: [TDObject.StickerEmojis]

        /**
         Represents a sticker set

         - Parameter id: Identifier of the sticker set
         - Parameter title: Title of the sticker set
         - Parameter name: Name of the sticker set
         - Parameter isInstalled: True, if the sticker set has been installed by the current user
         - Parameter isArchived: True, if the sticker set has been archived. A sticker set can't be installed and archived simultaneously
         - Parameter isOfficial: True, if the sticker set is official
         - Parameter isMasks: True, if the stickers in the set are masks
         - Parameter isViewed: True for already viewed trending sticker sets
         - Parameter stickers: List of stickers in this set
         - Parameter emojis: A list of emoji corresponding to the stickers in the same order
         */
        public init(id: Int64, title: String, name: String, isInstalled: Bool, isArchived: Bool, isOfficial: Bool, isMasks: Bool, isViewed: Bool, stickers: [TDObject.Sticker], emojis: [TDObject.StickerEmojis]) {
            self.id = id
            self.title = title
            self.name = name
            self.isInstalled = isInstalled
            self.isArchived = isArchived
            self.isOfficial = isOfficial
            self.isMasks = isMasks
            self.isViewed = isViewed
            self.stickers = stickers
            self.emojis = emojis
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            id = try container.decodeInt64(forKey: .init(string: "id"))
            title = try container.decode(String.self, forKey: .init(string: "title"))
            name = try container.decode(String.self, forKey: .init(string: "name"))
            isInstalled = try container.decode(Bool.self, forKey: .init(string: "isInstalled"))
            isArchived = try container.decode(Bool.self, forKey: .init(string: "isArchived"))
            isOfficial = try container.decode(Bool.self, forKey: .init(string: "isOfficial"))
            isMasks = try container.decode(Bool.self, forKey: .init(string: "isMasks"))
            isViewed = try container.decode(Bool.self, forKey: .init(string: "isViewed"))
            stickers = try container.decode([TDObject.Sticker].self, forKey: .init(string: "stickers"))
            emojis = try container.decode([TDObject.StickerEmojis].self, forKey: .init(string: "emojis"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(id, forKey: .init(string: "id"))
            try container.encode(title, forKey: .init(string: "title"))
            try container.encode(name, forKey: .init(string: "name"))
            try container.encode(isInstalled, forKey: .init(string: "isInstalled"))
            try container.encode(isArchived, forKey: .init(string: "isArchived"))
            try container.encode(isOfficial, forKey: .init(string: "isOfficial"))
            try container.encode(isMasks, forKey: .init(string: "isMasks"))
            try container.encode(isViewed, forKey: .init(string: "isViewed"))
            try container.encode(stickers, forKey: .init(string: "stickers"))
            try container.encode(emojis, forKey: .init(string: "emojis"))
        }
    }
}
