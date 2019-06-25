//
//  GetContacts.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns all user contacts

     - ReturnType: `TDObject.Users`
     */
    struct GetContacts: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Users

        /**
         Returns all user contacts
         */
        public init() {}
    }
}
