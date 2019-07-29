//
//  TMeUrls.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
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
        public var urls: [TDObject.TMeUrl]

        /**
         Contains a list of t.me URLs

         - Parameter urls: List of URLs
         */
        public init(urls: [TDObject.TMeUrl]) {
            self.urls = urls
        }
    }
}
