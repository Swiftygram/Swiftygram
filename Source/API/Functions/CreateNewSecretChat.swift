//
//  CreateNewSecretChat.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Creates a new secret chat. Returns the newly created chat

     - ReturnType: `TDObject.Chat`
     */
    struct CreateNewSecretChat: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Chat

        /**
         Identifier of the target user
         */
        public let userId: Int

        /**
         Creates a new secret chat. Returns the newly created chat

         - Parameter userId: Identifier of the target user
         */
        public init(userId: Int) {
            self.userId = userId
        }
    }
}
