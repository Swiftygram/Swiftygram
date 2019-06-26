//
//  Photo.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Describes a photo
     */
    struct Photo: TDObjectProtocol {
        /**
         True, if stickers were added to the photo
         */
        public let hasStickers: Bool

        /**
         Available variants of the photo, in different sizes
         */
        public let sizes: [TDObject.PhotoSize]

        /**
         Describes a photo

         - Parameter hasStickers: True, if stickers were added to the photo
         - Parameter sizes: Available variants of the photo, in different sizes
         */
        public init(hasStickers: Bool, sizes: [TDObject.PhotoSize]) {
            self.hasStickers = hasStickers
            self.sizes = sizes
        }
    }
}
