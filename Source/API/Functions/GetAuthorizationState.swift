//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns the current authorization state; this is an offline request. For informational purposes only. Use updateAuthorizationState instead to maintain the current authorization state

     - ReturnType: `TDEnum.AuthorizationState`
     */
    struct GetAuthorizationState: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDEnum.AuthorizationState

        /**
         Returns the current authorization state; this is an offline request. For informational purposes only. Use updateAuthorizationState instead to maintain the current authorization state
         */
        public init() {}
    }
}
