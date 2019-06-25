//
//  VideoNote.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Describes a video note. The video must be equal in width and height, cropped to a circle, and stored in MPEG4 format
     */
    struct VideoNote: TDObjectProtocol {
        /**
         Duration of the video, in seconds; as defined by the sender
         */
        public let duration: Int

        /**
         Video width and height; as defined by the sender
         */
        public let length: Int

        /**
         Video thumbnail; as defined by the sender; may be null
         */
        public let thumbnail: TDObject.PhotoSize

        /**
         File containing the video
         */
        public let video: TDObject.File

        /**
         Describes a video note. The video must be equal in width and height, cropped to a circle, and stored in MPEG4 format

         - Parameter duration: Duration of the video, in seconds; as defined by the sender
         - Parameter length: Video width and height; as defined by the sender
         - Parameter thumbnail: Video thumbnail; as defined by the sender; may be null
         - Parameter video: File containing the video
         */
        public init(duration: Int, length: Int, thumbnail: TDObject.PhotoSize, video: TDObject.File) {
            self.duration = duration
            self.length = length
            self.thumbnail = thumbnail
            self.video = video
        }
    }
}
