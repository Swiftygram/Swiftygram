//
//  Proxies.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Represents a list of proxy servers
     */
    struct Proxies: TDObjectProtocol {
        /**
         List of proxy servers
         */
        public var proxies: [TDObject.Proxy]

        /**
         Represents a list of proxy servers

         - Parameter proxies: List of proxy servers
         */
        public init(proxies: [TDObject.Proxy]) {
            self.proxies = proxies
        }
    }
}
