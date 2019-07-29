//
//  UpdateConnectionState.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     The connection state has changed
     */
    struct UpdateConnectionState: TDObject.Update {
        /**
         The new connection state
         */
        public var state: TDEnum.ConnectionState

        /**
         The connection state has changed

         - Parameter state: The new connection state
         */
        public init(state: TDEnum.ConnectionState) {
            self.state = state
        }
    }
}
