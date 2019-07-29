//
//  SearchHashtags.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Searches for recently used hashtags by their prefix

     - ReturnType: `TDObject.Hashtags`
     */
    struct SearchHashtags: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Hashtags

        /**
         Hashtag prefix to search for
         */
        public var prefix: String

        /**
         Maximum number of hashtags to be returned
         */
        public var limit: Int

        /**
         Searches for recently used hashtags by their prefix

         - Parameter prefix: Hashtag prefix to search for
         - Parameter limit: Maximum number of hashtags to be returned
         */
        public init(prefix: String, limit: Int) {
            self.prefix = prefix
            self.limit = limit
        }
    }
}
