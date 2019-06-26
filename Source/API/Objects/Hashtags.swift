//
//  Hashtags.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains a list of hashtags
     */
    struct Hashtags: TDObjectProtocol {
        /**
         A list of hashtags
         */
        public let hashtags: [String]

        /**
         Contains a list of hashtags

         - Parameter hashtags: A list of hashtags
         */
        public init(hashtags: [String]) {
            self.hashtags = hashtags
        }
    }
}
