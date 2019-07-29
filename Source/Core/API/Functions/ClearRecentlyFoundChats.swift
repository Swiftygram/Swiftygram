//
//  ClearRecentlyFoundChats.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Clears the list of recently found chats

     - ReturnType: `TDObject.Ok`
     */
    struct ClearRecentlyFoundChats: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Clears the list of recently found chats
         */
        public init() {}
    }
}
