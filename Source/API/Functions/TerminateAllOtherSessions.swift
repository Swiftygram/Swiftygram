//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Terminates all other sessions of the current user

     - ReturnType: `TDObject.Ok`
     */
    struct TerminateAllOtherSessions: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Terminates all other sessions of the current user
         */
        public init() {}
    }
}
