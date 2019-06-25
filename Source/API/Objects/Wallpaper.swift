//
//  Wallpaper.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains information about a wallpaper
     */
    struct Wallpaper: TDObjectProtocol {
        /**
         Unique persistent wallpaper identifier
         */
        public let id: Int

        /**
         Available variants of the wallpaper in different sizes. These photos can only be downloaded; they can't be sent in a message
         */
        public let sizes: [TDObject.PhotoSize]

        /**
         Main color of the wallpaper in RGB24 format; should be treated as background color if no photos are specified
         */
        public let color: Int

        /**
         Contains information about a wallpaper

         - Parameter id: Unique persistent wallpaper identifier
         - Parameter sizes: Available variants of the wallpaper in different sizes. These photos can only be downloaded; they can't be sent in a message
         - Parameter color: Main color of the wallpaper in RGB24 format; should be treated as background color if no photos are specified
         */
        public init(id: Int, sizes: [TDObject.PhotoSize], color: Int) {
            self.id = id
            self.sizes = sizes
            self.color = color
        }
    }
}
