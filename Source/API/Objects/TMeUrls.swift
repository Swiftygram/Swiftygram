//
//  TMeUrls.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains a list of t.me URLs
     */
    struct TMeUrls: TDObjectProtocol {
        /**
         List of URLs
         */
        public let urls: [TDObject.TMeUrl]

        /**
         Contains a list of t.me URLs

         - Parameter urls: List of URLs
         */
        public init(urls: [TDObject.TMeUrl]) {
            self.urls = urls
        }
    }
}
