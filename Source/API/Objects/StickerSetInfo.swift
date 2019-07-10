//
//  StickerSetInfo.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Represents short information about a sticker set
     */
    struct StickerSetInfo: TDObjectProtocol {
        /**
         Identifier of the sticker set
         */
        public var id: Int64

        /**
         Title of the sticker set
         */
        public var title: String

        /**
         Name of the sticker set
         */
        public var name: String

        /**
         True, if the sticker set has been installed by current user
         */
        public var isInstalled: Bool

        /**
         True, if the sticker set has been archived. A sticker set can't be installed and archived simultaneously
         */
        public var isArchived: Bool

        /**
         True, if the sticker set is official
         */
        public var isOfficial: Bool

        /**
         True, if the stickers in the set are masks
         */
        public var isMasks: Bool

        /**
         True for already viewed trending sticker sets
         */
        public var isViewed: Bool

        /**
         Total number of stickers in the set
         */
        public var size: Int

        /**
         Contains up to the first 5 stickers from the set, depending on the context. If the client needs more stickers the full set should be requested
         */
        public var covers: [TDObject.Sticker]

        /**
         Represents short information about a sticker set

         - Parameter id: Identifier of the sticker set
         - Parameter title: Title of the sticker set
         - Parameter name: Name of the sticker set
         - Parameter isInstalled: True, if the sticker set has been installed by current user
         - Parameter isArchived: True, if the sticker set has been archived. A sticker set can't be installed and archived simultaneously
         - Parameter isOfficial: True, if the sticker set is official
         - Parameter isMasks: True, if the stickers in the set are masks
         - Parameter isViewed: True for already viewed trending sticker sets
         - Parameter size: Total number of stickers in the set
         - Parameter covers: Contains up to the first 5 stickers from the set, depending on the context. If the client needs more stickers the full set should be requested
         */
        public init(id: Int64, title: String, name: String, isInstalled: Bool, isArchived: Bool, isOfficial: Bool, isMasks: Bool, isViewed: Bool, size: Int, covers: [TDObject.Sticker]) {
            self.id = id
            self.title = title
            self.name = name
            self.isInstalled = isInstalled
            self.isArchived = isArchived
            self.isOfficial = isOfficial
            self.isMasks = isMasks
            self.isViewed = isViewed
            self.size = size
            self.covers = covers
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
            size = try container.decode(Int.self, forKey: .init(string: "size"))
            covers = try container.decode([TDObject.Sticker].self, forKey: .init(string: "covers"))
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
            try container.encode(size, forKey: .init(string: "size"))
            try container.encode(covers, forKey: .init(string: "covers"))
        }
    }
}
