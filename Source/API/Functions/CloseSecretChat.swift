//
//  CloseSecretChat.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Closes a secret chat, effectively transfering its state to secretChatStateClosed

     - ReturnType: `TDObject.Ok`
     */
    struct CloseSecretChat: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Secret chat identifier
         */
        public let secretChatId: Int

        /**
         Closes a secret chat, effectively transfering its state to secretChatStateClosed

         - Parameter secretChatId: Secret chat identifier
         */
        public init(secretChatId: Int) {
            self.secretChatId = secretChatId
        }
    }
}
