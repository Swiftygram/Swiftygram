//
//  Animation.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
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
        public var duration: Int

        /**
         Width of the animation
         */
        public var width: Int

        /**
         Height of the animation
         */
        public var height: Int

        /**
         Original name of the file; as defined by the sender
         */
        public var fileName: String

        /**
         MIME type of the file, usually "image/gif" or "video/mp4"
         */
        public var mimeType: String

        /**
         Animation thumbnail; may be null
         */
        public var thumbnail: TDObject.PhotoSize?

        /**
         File containing the animation
         */
        public var animation: TDObject.File

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
        public init(duration: Int, width: Int, height: Int, fileName: String, mimeType: String, thumbnail: TDObject.PhotoSize?, animation: TDObject.File) {
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
