//
//  Video.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Describes a video file
     */
    struct Video: TDObjectProtocol {
        /**
         Duration of the video, in seconds; as defined by the sender
         */
        public var duration: Int

        /**
         Video width; as defined by the sender
         */
        public var width: Int

        /**
         Video height; as defined by the sender
         */
        public var height: Int

        /**
         Original name of the file; as defined by the sender
         */
        public var fileName: String

        /**
         MIME type of the file; as defined by the sender
         */
        public var mimeType: String

        /**
         True, if stickers were added to the photo
         */
        public var hasStickers: Bool

        /**
         True, if the video should be tried to be streamed
         */
        public var supportsStreaming: Bool

        /**
         Video thumbnail; as defined by the sender; may be null
         */
        public var thumbnail: TDObject.PhotoSize?

        /**
         File containing the video
         */
        public var video: TDObject.File

        /**
         Describes a video file

         - Parameter duration: Duration of the video, in seconds; as defined by the sender
         - Parameter width: Video width; as defined by the sender
         - Parameter height: Video height; as defined by the sender
         - Parameter fileName: Original name of the file; as defined by the sender
         - Parameter mimeType: MIME type of the file; as defined by the sender
         - Parameter hasStickers: True, if stickers were added to the photo
         - Parameter supportsStreaming: True, if the video should be tried to be streamed
         - Parameter thumbnail: Video thumbnail; as defined by the sender; may be null
         - Parameter video: File containing the video
         */
        public init(duration: Int, width: Int, height: Int, fileName: String, mimeType: String, hasStickers: Bool, supportsStreaming: Bool, thumbnail: TDObject.PhotoSize?, video: TDObject.File) {
            self.duration = duration
            self.width = width
            self.height = height
            self.fileName = fileName
            self.mimeType = mimeType
            self.hasStickers = hasStickers
            self.supportsStreaming = supportsStreaming
            self.thumbnail = thumbnail
            self.video = video
        }
    }
}
