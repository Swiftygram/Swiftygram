//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Removes a hashtag from the list of recently used hashtags

     - ReturnType: `TDObject.Ok`
     */
    struct RemoveRecentHashtag: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Hashtag to delete
         */
        public var hashtag: String

        /**
         Removes a hashtag from the list of recently used hashtags

         - Parameter hashtag: Hashtag to delete
         */
        public init(hashtag: String) {
            self.hashtag = hashtag
        }
    }
}
