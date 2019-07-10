//
//  ConnectedWebsites.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains a list of websites the current user is logged in with Telegram
     */
    struct ConnectedWebsites: TDObjectProtocol {
        /**
         List of connected websites
         */
        public var websites: [TDObject.ConnectedWebsite]

        /**
         Contains a list of websites the current user is logged in with Telegram

         - Parameter websites: List of connected websites
         */
        public init(websites: [TDObject.ConnectedWebsite]) {
            self.websites = websites
        }
    }
}
