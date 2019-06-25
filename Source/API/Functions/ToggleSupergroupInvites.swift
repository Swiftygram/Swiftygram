//
//  ToggleSupergroupInvites.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Toggles whether all members of a supergroup can add new members; requires appropriate administrator rights in the supergroup.

     - ReturnType: `TDObject.Ok`
     */
    struct ToggleSupergroupInvites: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Identifier of the supergroup
         */
        public let supergroupId: Int

        /**
         New value of anyone_can_invite
         */
        public let anyoneCanInvite: Bool

        /**
         Toggles whether all members of a supergroup can add new members; requires appropriate administrator rights in the supergroup.

         - Parameter supergroupId: Identifier of the supergroup
         - Parameter anyoneCanInvite: New value of anyone_can_invite
         */
        public init(supergroupId: Int, anyoneCanInvite: Bool) {
            self.supergroupId = supergroupId
            self.anyoneCanInvite = anyoneCanInvite
        }
    }
}
