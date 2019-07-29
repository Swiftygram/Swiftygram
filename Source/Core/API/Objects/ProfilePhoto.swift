//
//  ProfilePhoto.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Describes a user profile photo
     */
    struct ProfilePhoto: TDObjectProtocol {
        /**
         Photo identifier; 0 for an empty photo. Can be used to find a photo in a list of userProfilePhotos
         */
        public var id: Int64

        /**
         A small (160x160) user profile photo
         */
        public var small: TDObject.File

        /**
         A big (640x640) user profile photo
         */
        public var big: TDObject.File

        /**
         Describes a user profile photo

         - Parameter id: Photo identifier; 0 for an empty photo. Can be used to find a photo in a list of userProfilePhotos
         - Parameter small: A small (160x160) user profile photo
         - Parameter big: A big (640x640) user profile photo
         */
        public init(id: Int64, small: TDObject.File, big: TDObject.File) {
            self.id = id
            self.small = small
            self.big = big
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            id = try container.decodeInt64(forKey: .init(string: "id"))
            small = try container.decode(TDObject.File.self, forKey: .init(string: "small"))
            big = try container.decode(TDObject.File.self, forKey: .init(string: "big"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(id, forKey: .init(string: "id"))
            try container.encode(small, forKey: .init(string: "small"))
            try container.encode(big, forKey: .init(string: "big"))
        }
    }
}
