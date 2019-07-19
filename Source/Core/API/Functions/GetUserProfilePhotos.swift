//
//  GetUserProfilePhotos.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns the profile photos of a user. The result of this query may be outdated: some photos might have been deleted already

     - ReturnType: `TDObject.UserProfilePhotos`
     */
    struct GetUserProfilePhotos: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.UserProfilePhotos

        /**
         User identifier
         */
        public var userId: Int

        /**
         The number of photos to skip; must be non-negative
         */
        public var offset: Int

        /**
         Maximum number of photos to be returned; up to 100
         */
        public var limit: Int

        /**
         Returns the profile photos of a user. The result of this query may be outdated: some photos might have been deleted already

         - Parameter userId: User identifier
         - Parameter offset: The number of photos to skip; must be non-negative
         - Parameter limit: Maximum number of photos to be returned; up to 100
         */
        public init(userId: Int, offset: Int, limit: Int) {
            self.userId = userId
            self.offset = offset
            self.limit = limit
        }
    }
}
