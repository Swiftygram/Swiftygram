//
//  UserProfilePhotos.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains part of the list of user photos
     */
    struct UserProfilePhotos: TDObjectProtocol {
        /**
         Total number of user profile photos
         */
        public var totalCount: Int

        /**
         A list of photos
         */
        public var photos: [TDObject.UserProfilePhoto]

        /**
         Contains part of the list of user photos

         - Parameter totalCount: Total number of user profile photos
         - Parameter photos: A list of photos
         */
        public init(totalCount: Int, photos: [TDObject.UserProfilePhoto]) {
            self.totalCount = totalCount
            self.photos = photos
        }
    }
}
