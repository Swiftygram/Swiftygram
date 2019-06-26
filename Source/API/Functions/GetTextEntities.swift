//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns all entities (mentions, hashtags, cashtags, bot commands, URLs, and email addresses) contained in the text. This is an offline method. Can be called before authorization. Can be called synchronously

     - ReturnType: `TDObject.TextEntities`
     */
    struct GetTextEntities: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.TextEntities

        /**
         The text in which to look for entites
         */
        public var text: String

        /**
         Returns all entities (mentions, hashtags, cashtags, bot commands, URLs, and email addresses) contained in the text. This is an offline method. Can be called before authorization. Can be called synchronously

         - Parameter text: The text in which to look for entites
         */
        public init(text: String) {
            self.text = text
        }
    }
}
