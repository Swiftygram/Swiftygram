//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
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
