//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Disconnects all websites from the current user's Telegram account

     - ReturnType: `TDObject.Ok`
     */
    struct DisconnectAllWebsites: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Disconnects all websites from the current user's Telegram account
         */
        public init() {}
    }
}
