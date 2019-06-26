//
//  Call.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Describes a call
     */
    struct Call: TDObjectProtocol {
        /**
         Call identifier, not persistent
         */
        public let id: Int

        /**
         Peer user identifier
         */
        public let userId: Int

        /**
         True, if the call is outgoing
         */
        public let isOutgoing: Bool

        /**
         Call state
         */
        public let state: TDEnum.CallState

        /**
         Describes a call

         - Parameter id: Call identifier, not persistent
         - Parameter userId: Peer user identifier
         - Parameter isOutgoing: True, if the call is outgoing
         - Parameter state: Call state
         */
        public init(id: Int, userId: Int, isOutgoing: Bool, state: TDEnum.CallState) {
            self.id = id
            self.userId = userId
            self.isOutgoing = isOutgoing
            self.state = state
        }
    }
}
