//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Describes a voice note. The voice note must be encoded with the Opus codec, and stored inside an OGG container. Voice notes can have only a single audio channel
     */
    struct VoiceNote: TDObjectProtocol {
        /**
         Duration of the voice note, in seconds; as defined by the sender
         */
        public var duration: Int

        /**
         A waveform representation of the voice note in 5-bit format
         */
        public var waveform: String

        /**
         MIME type of the file; as defined by the sender
         */
        public var mimeType: String

        /**
         File containing the voice note
         */
        public var voice: TDObject.File

        /**
         Describes a voice note. The voice note must be encoded with the Opus codec, and stored inside an OGG container. Voice notes can have only a single audio channel

         - Parameter duration: Duration of the voice note, in seconds; as defined by the sender
         - Parameter waveform: A waveform representation of the voice note in 5-bit format
         - Parameter mimeType: MIME type of the file; as defined by the sender
         - Parameter voice: File containing the voice note
         */
        public init(duration: Int, waveform: String, mimeType: String, voice: TDObject.File) {
            self.duration = duration
            self.waveform = waveform
            self.mimeType = mimeType
            self.voice = voice
        }
    }
}
