//
//  HttpUrl.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains an HTTP URL
     */
    struct HttpUrl: TDObjectProtocol {
        /**
         The URL
         */
        public var url: URL

        /**
         Contains an HTTP URL

         - Parameter url: The URL
         */
        public init(url: URL) {
            self.url = url
        }
    }
}
