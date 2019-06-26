//
//  ChangeStickerSet.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Installs/uninstalls or activates/archives a sticker set

     - ReturnType: `TDObject.Ok`
     */
    struct ChangeStickerSet: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Identifier of the sticker set
         */
        public let setId: Int64

        /**
         The new value of is_installed
         */
        public let isInstalled: Bool

        /**
         The new value of is_archived. A sticker set can't be installed and archived simultaneously
         */
        public let isArchived: Bool

        /**
         Installs/uninstalls or activates/archives a sticker set

         - Parameter setId: Identifier of the sticker set
         - Parameter isInstalled: The new value of is_installed
         - Parameter isArchived: The new value of is_archived. A sticker set can't be installed and archived simultaneously
         */
        public init(setId: Int64, isInstalled: Bool, isArchived: Bool) {
            self.setId = setId
            self.isInstalled = isInstalled
            self.isArchived = isArchived
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            setId = try container.decodeInt64(forKey: .init(string: "setId"))
            isInstalled = try container.decode(Bool.self, forKey: .init(string: "isInstalled"))
            isArchived = try container.decode(Bool.self, forKey: .init(string: "isArchived"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(setId, forKey: .init(string: "setId"))
            try container.encode(isInstalled, forKey: .init(string: "isInstalled"))
            try container.encode(isArchived, forKey: .init(string: "isArchived"))
        }
    }
}
