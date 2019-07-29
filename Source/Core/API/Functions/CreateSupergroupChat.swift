//
//  CreateSupergroupChat.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns an existing chat corresponding to a known supergroup or channel

     - ReturnType: `TDObject.Chat`
     */
    struct CreateSupergroupChat: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Chat

        /**
         Supergroup or channel identifier
         */
        public var supergroupId: Int

        /**
         If true, the chat will be created without network request. In this case all information about the chat except its type, title and photo can be incorrect
         */
        public var force: Bool

        /**
         Returns an existing chat corresponding to a known supergroup or channel

         - Parameter supergroupId: Supergroup or channel identifier
         - Parameter force: If true, the chat will be created without network request. In this case all information about the chat except its type, title and photo can be incorrect
         */
        public init(supergroupId: Int, force: Bool) {
            self.supergroupId = supergroupId
            self.force = force
        }
    }
}
