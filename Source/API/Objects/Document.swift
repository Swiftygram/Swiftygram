//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Describes a document of any type
     */
    struct Document: TDObjectProtocol {
        /**
         Original name of the file; as defined by the sender
         */
        public var fileName: String

        /**
         MIME type of the file; as defined by the sender
         */
        public var mimeType: String

        /**
         Document thumbnail; as defined by the sender; may be null
         */
        public var thumbnail: TDObject.PhotoSize?

        /**
         File containing the document
         */
        public var document: TDObject.File

        /**
         Describes a document of any type

         - Parameter fileName: Original name of the file; as defined by the sender
         - Parameter mimeType: MIME type of the file; as defined by the sender
         - Parameter thumbnail: Document thumbnail; as defined by the sender; may be null
         - Parameter document: File containing the document
         */
        public init(fileName: String, mimeType: String, thumbnail: TDObject.PhotoSize?, document: TDObject.File) {
            self.fileName = fileName
            self.mimeType = mimeType
            self.thumbnail = thumbnail
            self.document = document
        }
    }
}
