//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
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
