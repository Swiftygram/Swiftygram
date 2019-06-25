//
//  SetUsername.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Changes the username of the current user. If something changes, updateUser will be sent

     - ReturnType: `TDObject.Ok`
     */
    struct SetUsername: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         The new value of the username. Use an empty string to remove the username
         */
        public let username: String

        /**
         Changes the username of the current user. If something changes, updateUser will be sent

         - Parameter username: The new value of the username. Use an empty string to remove the username
         */
        public init(username: String) {
            self.username = username
        }
    }
}
