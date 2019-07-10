//
//  Sticker.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Describes a sticker
     */
    struct Sticker: TDObjectProtocol {
        /**
         The identifier of the sticker set to which the sticker belongs; 0 if none
         */
        public var setId: Int64

        /**
         Sticker width; as defined by the sender
         */
        public var width: Int

        /**
         Sticker height; as defined by the sender
         */
        public var height: Int

        /**
         Emoji corresponding to the sticker
         */
        public var emoji: String

        /**
         True, if the sticker is a mask
         */
        public var isMask: Bool

        /**
         Position where the mask should be placed; may be null
         */
        public var maskPosition: TDObject.MaskPosition?

        /**
         Sticker thumbnail in WEBP or JPEG format; may be null
         */
        public var thumbnail: TDObject.PhotoSize?

        /**
         File containing the sticker
         */
        public var sticker: TDObject.File

        /**
         Describes a sticker

         - Parameter setId: The identifier of the sticker set to which the sticker belongs; 0 if none
         - Parameter width: Sticker width; as defined by the sender
         - Parameter height: Sticker height; as defined by the sender
         - Parameter emoji: Emoji corresponding to the sticker
         - Parameter isMask: True, if the sticker is a mask
         - Parameter maskPosition: Position where the mask should be placed; may be null
         - Parameter thumbnail: Sticker thumbnail in WEBP or JPEG format; may be null
         - Parameter sticker: File containing the sticker
         */
        public init(setId: Int64, width: Int, height: Int, emoji: String, isMask: Bool, maskPosition: TDObject.MaskPosition?, thumbnail: TDObject.PhotoSize?, sticker: TDObject.File) {
            self.setId = setId
            self.width = width
            self.height = height
            self.emoji = emoji
            self.isMask = isMask
            self.maskPosition = maskPosition
            self.thumbnail = thumbnail
            self.sticker = sticker
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            setId = try container.decodeInt64(forKey: .init(string: "setId"))
            width = try container.decode(Int.self, forKey: .init(string: "width"))
            height = try container.decode(Int.self, forKey: .init(string: "height"))
            emoji = try container.decode(String.self, forKey: .init(string: "emoji"))
            isMask = try container.decode(Bool.self, forKey: .init(string: "isMask"))
            maskPosition = try container.decodeIfPresent(TDObject.MaskPosition.self, forKey: .init(string: "maskPosition"))
            thumbnail = try container.decodeIfPresent(TDObject.PhotoSize.self, forKey: .init(string: "thumbnail"))
            sticker = try container.decode(TDObject.File.self, forKey: .init(string: "sticker"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(setId, forKey: .init(string: "setId"))
            try container.encode(width, forKey: .init(string: "width"))
            try container.encode(height, forKey: .init(string: "height"))
            try container.encode(emoji, forKey: .init(string: "emoji"))
            try container.encode(isMask, forKey: .init(string: "isMask"))
            try container.encodeIfPresent(maskPosition, forKey: .init(string: "maskPosition"))
            try container.encodeIfPresent(thumbnail, forKey: .init(string: "thumbnail"))
            try container.encode(sticker, forKey: .init(string: "sticker"))
        }
    }
}
