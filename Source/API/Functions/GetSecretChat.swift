//
//  GetSecretChat.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns information about a secret chat by its identifier. This is an offline request

     - ReturnType: `TDObject.SecretChat`
     */
    struct GetSecretChat: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.SecretChat

        /**
         Secret chat identifier
         */
        public let secretChatId: Int

        /**
         Returns information about a secret chat by its identifier. This is an offline request

         - Parameter secretChatId: Secret chat identifier
         */
        public init(secretChatId: Int) {
            self.secretChatId = secretChatId
        }
    }
}
