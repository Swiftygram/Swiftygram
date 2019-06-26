//
//  GetActiveSessions.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns all active sessions of the current user

     - ReturnType: `TDObject.Sessions`
     */
    struct GetActiveSessions: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Sessions

        /**
         Returns all active sessions of the current user
         */
        public init() {}
    }
}
