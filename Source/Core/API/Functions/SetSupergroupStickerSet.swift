//
//  SetSupergroupStickerSet.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Changes the sticker set of a supergroup; requires appropriate rights in the supergroup

     - ReturnType: `TDObject.Ok`
     */
    struct SetSupergroupStickerSet: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Identifier of the supergroup
         */
        public var supergroupId: Int

        /**
         New value of the supergroup sticker set identifier. Use 0 to remove the supergroup sticker set
         */
        public var stickerSetId: Int64

        /**
         Changes the sticker set of a supergroup; requires appropriate rights in the supergroup

         - Parameter supergroupId: Identifier of the supergroup
         - Parameter stickerSetId: New value of the supergroup sticker set identifier. Use 0 to remove the supergroup sticker set
         */
        public init(supergroupId: Int, stickerSetId: Int64) {
            self.supergroupId = supergroupId
            self.stickerSetId = stickerSetId
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            supergroupId = try container.decode(Int.self, forKey: .init(string: "supergroupId"))
            stickerSetId = try container.decodeInt64(forKey: .init(string: "stickerSetId"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encode(supergroupId, forKey: .init(string: "supergroupId"))
            try container.encodeInt64(stickerSetId, forKey: .init(string: "stickerSetId"))
        }
    }
}
