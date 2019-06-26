//
//  TMeUrl.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
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
        public let url: URL

        /**
         Type of the URL
         */
        public let type: TDEnum.TMeUrlType

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
