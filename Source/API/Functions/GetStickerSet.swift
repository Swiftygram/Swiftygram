//
//  GetStickerSet.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns information about a sticker set by its identifier

     - ReturnType: `TDObject.StickerSet`
     */
    struct GetStickerSet: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.StickerSet

        /**
         Identifier of the sticker set
         */
        public let setId: Int64

        /**
         Returns information about a sticker set by its identifier

         - Parameter setId: Identifier of the sticker set
         */
        public init(setId: Int64) {
            self.setId = setId
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            setId = try container.decodeInt64(forKey: .init(string: "setId"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(setId, forKey: .init(string: "setId"))
        }
    }
}
