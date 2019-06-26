//
//  ViewTrendingStickerSets.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Informs the server that some trending sticker sets have been viewed by the user

     - ReturnType: `TDObject.Ok`
     */
    struct ViewTrendingStickerSets: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Identifiers of viewed trending sticker sets
         */
        public let stickerSetIds: [Int64]

        /**
         Informs the server that some trending sticker sets have been viewed by the user

         - Parameter stickerSetIds: Identifiers of viewed trending sticker sets
         */
        public init(stickerSetIds: [Int64]) {
            self.stickerSetIds = stickerSetIds
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            stickerSetIds = try container.decodeInt64Array(forKey: .init(string: "stickerSetIds"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64Array(stickerSetIds, forKey: .init(string: "stickerSetIds"))
        }
    }
}
