//
//  UpdateAuthorizationState.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

extension TDObject {
    /**
     The user authorization state has changed
     */
    struct UpdateAuthorizationState: TDObject.Update {
        /**
         New authorization state
         */
        public var authorizationState: TDEnum.AuthorizationState

        /**
         The user authorization state has changed

         - Parameter authorizationState: New authorization state
         */
        public init(authorizationState: TDEnum.AuthorizationState) {
            self.authorizationState = authorizationState
        }
    }
}
