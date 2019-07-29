//
//  WebPage.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Describes a web page preview
     */
    struct WebPage: TDObjectProtocol {
        /**
         Original URL of the link
         */
        public var url: URL

        /**
         URL to display
         */
        public var displayUrl: URL

        /**
         Type of the web page. Can be: article, photo, audio, video, document, profile, app, or something else
         */
        public var type: String

        /**
         Short name of the site (e.g., Google Docs, App Store)
         */
        public var siteName: String

        /**
         Title of the content
         */
        public var title: String

        /**
         Description of the content
         */
        public var description: String

        /**
         Image representing the content; may be null
         */
        public var photo: TDObject.Photo?

        /**
         URL to show in the embedded preview
         */
        public var embedUrl: URL

        /**
         MIME type of the embedded preview, (e.g., text/html or video/mp4)
         */
        public var embedType: String

        /**
         Width of the embedded preview
         */
        public var embedWidth: Int

        /**
         Height of the embedded preview
         */
        public var embedHeight: Int

        /**
         Duration of the content, in seconds
         */
        public var duration: Int

        /**
         Author of the content
         */
        public var author: String

        /**
         Preview of the content as an animation, if available; may be null
         */
        public var animation: TDObject.Animation?

        /**
         Preview of the content as an audio file, if available; may be null
         */
        public var audio: TDObject.Audio?

        /**
         Preview of the content as a document, if available (currently only available for small PDF files and ZIP archives); may be null
         */
        public var document: TDObject.Document?

        /**
         Preview of the content as a sticker for small WEBP files, if available; may be null
         */
        public var sticker: TDObject.Sticker?

        /**
         Preview of the content as a video, if available; may be null
         */
        public var video: TDObject.Video?

        /**
         Preview of the content as a video note, if available; may be null
         */
        public var videoNote: TDObject.VideoNote?

        /**
         Preview of the content as a voice note, if available; may be null
         */
        public var voiceNote: TDObject.VoiceNote?

        /**
         Version of instant view, available for the web page (currently can be 1 or 2), 0 if none
         */
        public var instantViewVersion: Int

        /**
         Describes a web page preview

         - Parameter url: Original URL of the link
         - Parameter displayUrl: URL to display
         - Parameter type: Type of the web page. Can be: article, photo, audio, video, document, profile, app, or something else
         - Parameter siteName: Short name of the site (e.g., Google Docs, App Store)
         - Parameter title: Title of the content
         - Parameter description: Description of the content
         - Parameter photo: Image representing the content; may be null
         - Parameter embedUrl: URL to show in the embedded preview
         - Parameter embedType: MIME type of the embedded preview, (e.g., text/html or video/mp4)
         - Parameter embedWidth: Width of the embedded preview
         - Parameter embedHeight: Height of the embedded preview
         - Parameter duration: Duration of the content, in seconds
         - Parameter author: Author of the content
         - Parameter animation: Preview of the content as an animation, if available; may be null
         - Parameter audio: Preview of the content as an audio file, if available; may be null
         - Parameter document: Preview of the content as a document, if available (currently only available for small PDF files and ZIP archives); may be null
         - Parameter sticker: Preview of the content as a sticker for small WEBP files, if available; may be null
         - Parameter video: Preview of the content as a video, if available; may be null
         - Parameter videoNote: Preview of the content as a video note, if available; may be null
         - Parameter voiceNote: Preview of the content as a voice note, if available; may be null
         - Parameter instantViewVersion: Version of instant view, available for the web page (currently can be 1 or 2), 0 if none
         */
        public init(url: URL, displayUrl: URL, type: String, siteName: String, title: String, description: String, photo: TDObject.Photo?, embedUrl: URL, embedType: String, embedWidth: Int, embedHeight: Int, duration: Int, author: String, animation: TDObject.Animation?, audio: TDObject.Audio?, document: TDObject.Document?, sticker: TDObject.Sticker?, video: TDObject.Video?, videoNote: TDObject.VideoNote?, voiceNote: TDObject.VoiceNote?, instantViewVersion: Int) {
            self.url = url
            self.displayUrl = displayUrl
            self.type = type
            self.siteName = siteName
            self.title = title
            self.description = description
            self.photo = photo
            self.embedUrl = embedUrl
            self.embedType = embedType
            self.embedWidth = embedWidth
            self.embedHeight = embedHeight
            self.duration = duration
            self.author = author
            self.animation = animation
            self.audio = audio
            self.document = document
            self.sticker = sticker
            self.video = video
            self.videoNote = videoNote
            self.voiceNote = voiceNote
            self.instantViewVersion = instantViewVersion
        }
    }
}
