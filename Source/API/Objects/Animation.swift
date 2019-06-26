//
//  Animation.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Describes an animation file. The animation must be encoded in GIF or MPEG4 format
     */
    struct Animation: TDObjectProtocol {
        /**
         Duration of the animation, in seconds; as defined by the sender
         */
        public let duration: Int

        /**
         Width of the animation
         */
        public let width: Int

        /**
         Height of the animation
         */
        public let height: Int

        /**
         Original name of the file; as defined by the sender
         */
        public let fileName: String

        /**
         MIME type of the file, usually "image/gif" or "video/mp4"
         */
        public let mimeType: String

        /**
         Animation thumbnail; may be null
         */
        public let thumbnail: TDObject.PhotoSize

        /**
         File containing the animation
         */
        public let animation: TDObject.File

        /**
         Describes an animation file. The animation must be encoded in GIF or MPEG4 format

         - Parameter duration: Duration of the animation, in seconds; as defined by the sender
         - Parameter width: Width of the animation
         - Parameter height: Height of the animation
         - Parameter fileName: Original name of the file; as defined by the sender
         - Parameter mimeType: MIME type of the file, usually "image/gif" or "video/mp4"
         - Parameter thumbnail: Animation thumbnail; may be null
         - Parameter animation: File containing the animation
         */
        public init(duration: Int, width: Int, height: Int, fileName: String, mimeType: String, thumbnail: TDObject.PhotoSize, animation: TDObject.File) {
            self.duration = duration
            self.width = width
            self.height = height
            self.fileName = fileName
            self.mimeType = mimeType
            self.thumbnail = thumbnail
            self.animation = animation
        }
    }
}
