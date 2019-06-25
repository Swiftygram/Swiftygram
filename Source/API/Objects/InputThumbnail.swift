//
//  InputThumbnail.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     A thumbnail to be sent along with a file; should be in JPEG or WEBP format for stickers, and less than 200 kB in size
     */
    struct InputThumbnail: TDObjectProtocol {
        /**
         Thumbnail file to send. Sending thumbnails by file_id is currently not supported
         */
        public let thumbnail: TDEnum.InputFile

        /**
         Thumbnail width, usually shouldn't exceed 320. Use 0 if unknown
         */
        public let width: Int

        /**
         Thumbnail height, usually shouldn't exceed 320. Use 0 if unknown
         */
        public let height: Int

        /**
         A thumbnail to be sent along with a file; should be in JPEG or WEBP format for stickers, and less than 200 kB in size

         - Parameter thumbnail: Thumbnail file to send. Sending thumbnails by file_id is currently not supported
         - Parameter width: Thumbnail width, usually shouldn't exceed 320. Use 0 if unknown
         - Parameter height: Thumbnail height, usually shouldn't exceed 320. Use 0 if unknown
         */
        public init(thumbnail: TDEnum.InputFile, width: Int, height: Int) {
            self.thumbnail = thumbnail
            self.width = width
            self.height = height
        }
    }
}
