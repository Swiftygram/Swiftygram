//
//  ClearAllDraftMessages.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Clears draft messages in all chats

     - ReturnType: `TDObject.Ok`
     */
    struct ClearAllDraftMessages: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         If true, local draft messages in secret chats will not be cleared
         */
        public var excludeSecretChats: Bool

        /**
         Clears draft messages in all chats

         - Parameter excludeSecretChats: If true, local draft messages in secret chats will not be cleared
         */
        public init(excludeSecretChats: Bool) {
            self.excludeSecretChats = excludeSecretChats
        }
    }
}
