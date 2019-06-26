//
//  DeleteProfilePhoto.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Deletes a profile photo. If something changes, updateUser will be sent

     - ReturnType: `TDObject.Ok`
     */
    struct DeleteProfilePhoto: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Identifier of the profile photo to delete
         */
        public let profilePhotoId: Int64

        /**
         Deletes a profile photo. If something changes, updateUser will be sent

         - Parameter profilePhotoId: Identifier of the profile photo to delete
         */
        public init(profilePhotoId: Int64) {
            self.profilePhotoId = profilePhotoId
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            profilePhotoId = try container.decodeInt64(forKey: .init(string: "profilePhotoId"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(profilePhotoId, forKey: .init(string: "profilePhotoId"))
        }
    }
}
