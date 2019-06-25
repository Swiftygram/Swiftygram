//
//  CreatePrivateChat.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns an existing chat corresponding to a given user

     - ReturnType: `TDObject.Chat`
     */
    struct CreatePrivateChat: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Chat

        /**
         User identifier
         */
        public let userId: Int

        /**
         If true, the chat will be created without network request. In this case all information about the chat except its type, title and photo can be incorrect
         */
        public let force: Bool

        /**
         Returns an existing chat corresponding to a given user

         - Parameter userId: User identifier
         - Parameter force: If true, the chat will be created without network request. In this case all information about the chat except its type, title and photo can be incorrect
         */
        public init(userId: Int, force: Bool) {
            self.userId = userId
            self.force = force
        }
    }
}
