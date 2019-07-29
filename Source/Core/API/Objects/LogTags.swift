//
//  LogTags.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains a list of available TDLib internal log tags
     */
    struct LogTags: TDObjectProtocol {
        /**
         List of log tags
         */
        public var tags: [String]

        /**
         Contains a list of available TDLib internal log tags

         - Parameter tags: List of log tags
         */
        public init(tags: [String]) {
            self.tags = tags
        }
    }
}
