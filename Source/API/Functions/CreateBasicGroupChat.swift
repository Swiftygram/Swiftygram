//
//  CreateBasicGroupChat.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns an existing chat corresponding to a known basic group

     - ReturnType: `TDObject.Chat`
     */
    struct CreateBasicGroupChat: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Chat

        /**
         Basic group identifier
         */
        public let basicGroupId: Int

        /**
         If true, the chat will be created without network request. In this case all information about the chat except its type, title and photo can be incorrect
         */
        public let force: Bool

        /**
         Returns an existing chat corresponding to a known basic group

         - Parameter basicGroupId: Basic group identifier
         - Parameter force: If true, the chat will be created without network request. In this case all information about the chat except its type, title and photo can be incorrect
         */
        public init(basicGroupId: Int, force: Bool) {
            self.basicGroupId = basicGroupId
            self.force = force
        }
    }
}
