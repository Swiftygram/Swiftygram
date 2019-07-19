//
//  CreateSecretChat.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns an existing chat corresponding to a known secret chat

     - ReturnType: `TDObject.Chat`
     */
    struct CreateSecretChat: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Chat

        /**
         Secret chat identifier
         */
        public var secretChatId: Int

        /**
         Returns an existing chat corresponding to a known secret chat

         - Parameter secretChatId: Secret chat identifier
         */
        public init(secretChatId: Int) {
            self.secretChatId = secretChatId
        }
    }
}
