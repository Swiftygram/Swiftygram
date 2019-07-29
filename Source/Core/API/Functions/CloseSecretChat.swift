//
//  CloseSecretChat.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
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
        public var secretChatId: Int

        /**
         Closes a secret chat, effectively transfering its state to secretChatStateClosed

         - Parameter secretChatId: Secret chat identifier
         */
        public init(secretChatId: Int) {
            self.secretChatId = secretChatId
        }
    }
}
