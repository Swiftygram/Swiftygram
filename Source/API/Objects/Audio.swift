//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Describes an audio file. Audio is usually in MP3 format
     */
    struct Audio: TDObjectProtocol {
        /**
         Duration of the audio, in seconds; as defined by the sender
         */
        public var duration: Int

        /**
         Title of the audio; as defined by the sender
         */
        public var title: String

        /**
         Performer of the audio; as defined by the sender
         */
        public var performer: String

        /**
         Original name of the file; as defined by the sender
         */
        public var fileName: String

        /**
         The MIME type of the file; as defined by the sender
         */
        public var mimeType: String

        /**
         The thumbnail of the album cover; as defined by the sender. The full size thumbnail should be extracted from the downloaded file; may be null
         */
        public var albumCoverThumbnail: TDObject.PhotoSize?

        /**
         File containing the audio
         */
        public var audio: TDObject.File

        /**
         Describes an audio file. Audio is usually in MP3 format

         - Parameter duration: Duration of the audio, in seconds; as defined by the sender
         - Parameter title: Title of the audio; as defined by the sender
         - Parameter performer: Performer of the audio; as defined by the sender
         - Parameter fileName: Original name of the file; as defined by the sender
         - Parameter mimeType: The MIME type of the file; as defined by the sender
         - Parameter albumCoverThumbnail: The thumbnail of the album cover; as defined by the sender. The full size thumbnail should be extracted from the downloaded file; may be null
         - Parameter audio: File containing the audio
         */
        public init(duration: Int, title: String, performer: String, fileName: String, mimeType: String, albumCoverThumbnail: TDObject.PhotoSize?, audio: TDObject.File) {
            self.duration = duration
            self.title = title
            self.performer = performer
            self.fileName = fileName
            self.mimeType = mimeType
            self.albumCoverThumbnail = albumCoverThumbnail
            self.audio = audio
        }
    }
}
