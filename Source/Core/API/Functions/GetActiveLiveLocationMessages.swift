//
//  GetActiveLiveLocationMessages.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns all active live locations that should be updated by the client. The list is persistent across application restarts only if the message database is used

     - ReturnType: `TDObject.Messages`
     */
    struct GetActiveLiveLocationMessages: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Messages

        /**
         Returns all active live locations that should be updated by the client. The list is persistent across application restarts only if the message database is used
         */
        public init() {}
    }
}
