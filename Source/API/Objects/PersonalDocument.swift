//
//  PersonalDocument.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     A personal document, containing some information about a user
     */
    struct PersonalDocument: TDObjectProtocol {
        /**
         List of files containing the pages of the document
         */
        public let files: [TDObject.DatedFile]

        /**
         List of files containing a certified English translation of the document
         */
        public let translation: [TDObject.DatedFile]

        /**
         A personal document, containing some information about a user

         - Parameter files: List of files containing the pages of the document
         - Parameter translation: List of files containing a certified English translation of the document
         */
        public init(files: [TDObject.DatedFile], translation: [TDObject.DatedFile]) {
            self.files = files
            self.translation = translation
        }
    }
}
