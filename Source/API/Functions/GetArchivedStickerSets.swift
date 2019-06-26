//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns a list of archived sticker sets

     - ReturnType: `TDObject.StickerSets`
     */
    struct GetArchivedStickerSets: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.StickerSets

        /**
         Pass true to return mask stickers sets; pass false to return ordinary sticker sets
         */
        public var isMasks: Bool

        /**
         Identifier of the sticker set from which to return the result
         */
        public var offsetStickerSetId: Int64

        /**
         Maximum number of sticker sets to return
         */
        public var limit: Int

        /**
         Returns a list of archived sticker sets

         - Parameter isMasks: Pass true to return mask stickers sets; pass false to return ordinary sticker sets
         - Parameter offsetStickerSetId: Identifier of the sticker set from which to return the result
         - Parameter limit: Maximum number of sticker sets to return
         */
        public init(isMasks: Bool, offsetStickerSetId: Int64, limit: Int) {
            self.isMasks = isMasks
            self.offsetStickerSetId = offsetStickerSetId
            self.limit = limit
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            isMasks = try container.decode(Bool.self, forKey: .init(string: "isMasks"))
            offsetStickerSetId = try container.decodeInt64(forKey: .init(string: "offsetStickerSetId"))
            limit = try container.decode(Int.self, forKey: .init(string: "limit"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encode(isMasks, forKey: .init(string: "isMasks"))
            try container.encodeInt64(offsetStickerSetId, forKey: .init(string: "offsetStickerSetId"))
            try container.encode(limit, forKey: .init(string: "limit"))
        }
    }
}
