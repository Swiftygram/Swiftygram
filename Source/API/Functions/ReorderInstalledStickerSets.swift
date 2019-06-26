//
//  ReorderInstalledStickerSets.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Changes the order of installed sticker sets

     - ReturnType: `TDObject.Ok`
     */
    struct ReorderInstalledStickerSets: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Pass true to change the order of mask sticker sets; pass false to change the order of ordinary sticker sets
         */
        public let isMasks: Bool

        /**
         Identifiers of installed sticker sets in the new correct order
         */
        public let stickerSetIds: [Int64]

        /**
         Changes the order of installed sticker sets

         - Parameter isMasks: Pass true to change the order of mask sticker sets; pass false to change the order of ordinary sticker sets
         - Parameter stickerSetIds: Identifiers of installed sticker sets in the new correct order
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
