//
//  GetRecentlyVisitedTMeUrls.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns t.me URLs recently visited by a newly registered user

     - ReturnType: `TDObject.TMeUrls`
     */
    struct GetRecentlyVisitedTMeUrls: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.TMeUrls

        /**
         Google Play referrer to identify the user
         */
        public let referrer: String

        /**
         Returns t.me URLs recently visited by a newly registered user

         - Parameter referrer: Google Play referrer to identify the user
         */
        public init(referrer: String) {
            self.referrer = referrer
        }
    }
}
