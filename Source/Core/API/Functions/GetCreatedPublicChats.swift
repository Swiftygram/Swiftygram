//
//  GetCreatedPublicChats.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns a list of public chats created by the user

     - ReturnType: `TDObject.Chats`
     */
    struct GetCreatedPublicChats: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Chats

        /**
         Returns a list of public chats created by the user
         */
        public init() {}
    }
}
