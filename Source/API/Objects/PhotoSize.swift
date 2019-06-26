//
//  PhotoSize.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Photo description
     */
    struct PhotoSize: TDObjectProtocol {
        /**
         Thumbnail type (see https://core.telegram.org/constructor/photoSize)
         */
        public let type: String

        /**
         Information about the photo file
         */
        public let photo: TDObject.File

        /**
         Photo width
         */
        public let width: Int

        /**
         Photo height
         */
        public let height: Int

        /**
         Photo description

         - Parameter type: Thumbnail type (see https://core.telegram.org/constructor/photoSize)
         - Parameter photo: Information about the photo file
         - Parameter width: Photo width
         - Parameter height: Photo height
         */
        public init(type: String, photo: TDObject.File, width: Int, height: Int) {
            self.type = type
            self.photo = photo
            self.width = width
            self.height = height
        }
    }
}
