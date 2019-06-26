//
//  UpdateInstalledStickerSets.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     The list of installed sticker sets was updated
     */
    struct UpdateInstalledStickerSets: TDObject.Update {
        /**
         True, if the list of installed mask sticker sets was updated
         */
        public let isMasks: Bool

        /**
         The new list of installed ordinary sticker sets
         */
        public let stickerSetIds: [Int64]

        /**
         The list of installed sticker sets was updated

         - Parameter isMasks: True, if the list of installed mask sticker sets was updated
         - Parameter stickerSetIds: The new list of installed ordinary sticker sets
         */
        public init(isMasks: Bool, stickerSetIds: [Int64]) {
            self.isMasks = isMasks
            self.stickerSetIds = stickerSetIds
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            isMasks = try container.decode(Bool.self, forKey: .init(string: "isMasks"))
            stickerSetIds = try container.decodeInt64Array(forKey: .init(string: "stickerSetIds"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encode(isMasks, forKey: .init(string: "isMasks"))
            try container.encodeInt64Array(stickerSetIds, forKey: .init(string: "stickerSetIds"))
        }
    }
}
