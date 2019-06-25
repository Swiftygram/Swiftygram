//
//  GetMapThumbnailFile.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns information about a file with a map thumbnail in PNG format. Only map thumbnail files with size less than 1MB can be downloaded

     - ReturnType: `TDObject.File`
     */
    struct GetMapThumbnailFile: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.File

        /**
         Location of the map center
         */
        public let location: TDObject.Location

        /**
         Map zoom level; 13-20
         */
        public let zoom: Int

        /**
         Map width in pixels before applying scale; 16-1024
         */
        public let width: Int

        /**
         Map height in pixels before applying scale; 16-1024
         */
        public let height: Int

        /**
         Map scale; 1-3
         */
        public let scale: Int

        /**
         Identifier of a chat, in which the thumbnail will be shown. Use 0 if unknown
         */
        public let chatId: Int64

        /**
         Returns information about a file with a map thumbnail in PNG format. Only map thumbnail files with size less than 1MB can be downloaded

         - Parameter location: Location of the map center
         - Parameter zoom: Map zoom level; 13-20
         - Parameter width: Map width in pixels before applying scale; 16-1024
         - Parameter height: Map height in pixels before applying scale; 16-1024
         - Parameter scale: Map scale; 1-3
         - Parameter chatId: Identifier of a chat, in which the thumbnail will be shown. Use 0 if unknown
         */
        public init(location: TDObject.Location, zoom: Int, width: Int, height: Int, scale: Int, chatId: Int64) {
            self.location = location
            self.zoom = zoom
            self.width = width
            self.height = height
            self.scale = scale
            self.chatId = chatId
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            location = try container.decode(TDObject.Location.self, forKey: .init(string: "location"))
            zoom = try container.decode(Int.self, forKey: .init(string: "zoom"))
            width = try container.decode(Int.self, forKey: .init(string: "width"))
            height = try container.decode(Int.self, forKey: .init(string: "height"))
            scale = try container.decode(Int.self, forKey: .init(string: "scale"))
            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encode(location, forKey: .init(string: "location"))
            try container.encode(zoom, forKey: .init(string: "zoom"))
            try container.encode(width, forKey: .init(string: "width"))
            try container.encode(height, forKey: .init(string: "height"))
            try container.encode(scale, forKey: .init(string: "scale"))
            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
        }
    }
}
