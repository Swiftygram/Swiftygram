//
//  UserProfilePhoto.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains full information about a user profile photo
     */
    struct UserProfilePhoto: TDObjectProtocol {
        /**
         Unique user profile photo identifier
         */
        public var id: Int64

        /**
         Point in time (Unix timestamp) when the photo has been added
         */
        public var addedDate: Foundation.Date

        /**
         Available variants of the user photo, in different sizes
         */
        public var sizes: [TDObject.PhotoSize]

        /**
         Contains full information about a user profile photo

         - Parameter id: Unique user profile photo identifier
         - Parameter addedDate: Point in time (Unix timestamp) when the photo has been added
         - Parameter sizes: Available variants of the user photo, in different sizes
         */
        public init(id: Int64, addedDate: Foundation.Date, sizes: [TDObject.PhotoSize]) {
            self.id = id
            self.addedDate = addedDate
            self.sizes = sizes
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            id = try container.decodeInt64(forKey: .init(string: "id"))
            addedDate = try container.decodeDate(forKey: .init(string: "addedDate"))
            sizes = try container.decode([TDObject.PhotoSize].self, forKey: .init(string: "sizes"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(id, forKey: .init(string: "id"))
            try container.encodeDate(addedDate, forKey: .init(string: "addedDate"))
            try container.encode(sizes, forKey: .init(string: "sizes"))
        }
    }
}
