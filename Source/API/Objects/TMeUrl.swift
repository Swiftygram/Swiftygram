//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Represents a URL linking to an internal Telegram entity
     */
    struct TMeUrl: TDObjectProtocol {
        /**
         URL
         */
        public var url: URL

        /**
         Type of the URL
         */
        public var type: TDEnum.TMeUrlType

        /**
         Represents a URL linking to an internal Telegram entity

         - Parameter url: URL
         - Parameter type: Type of the URL
         */
        public init(url: URL, type: TDEnum.TMeUrlType) {
            self.url = url
            self.type = type
        }
    }
}
