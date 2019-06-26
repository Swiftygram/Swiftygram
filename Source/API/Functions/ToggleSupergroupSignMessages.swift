//
//  ToggleSupergroupSignMessages.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Toggles sender signatures messages sent in a channel; requires appropriate administrator rights in the channel.

     - ReturnType: `TDObject.Ok`
     */
    struct ToggleSupergroupSignMessages: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Identifier of the channel
         */
        public let supergroupId: Int

        /**
         New value of sign_messages
         */
        public let signMessages: Bool

        /**
         Toggles sender signatures messages sent in a channel; requires appropriate administrator rights in the channel.

         - Parameter supergroupId: Identifier of the channel
         - Parameter signMessages: New value of sign_messages
         */
        public init(supergroupId: Int, signMessages: Bool) {
            self.supergroupId = supergroupId
            self.signMessages = signMessages
        }
    }
}
