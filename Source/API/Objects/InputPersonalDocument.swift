//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     A personal document to be saved to Telegram Passport
     */
    struct InputPersonalDocument: TDObjectProtocol {
        /**
         List of files containing the pages of the document
         */
        public var files: [TDEnum.InputFile]

        /**
         List of files containing a certified English translation of the document
         */
        public var translation: [TDEnum.InputFile]

        /**
         A personal document to be saved to Telegram Passport

         - Parameter files: List of files containing the pages of the document
         - Parameter translation: List of files containing a certified English translation of the document
         */
        public init(files: [TDEnum.InputFile], translation: [TDEnum.InputFile]) {
            self.files = files
            self.translation = translation
        }
    }
}
