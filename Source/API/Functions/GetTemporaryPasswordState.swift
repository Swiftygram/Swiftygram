//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns information about the current temporary password

     - ReturnType: `TDObject.TemporaryPasswordState`
     */
    struct GetTemporaryPasswordState: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.TemporaryPasswordState

        /**
         Returns information about the current temporary password
         */
        public init() {}
    }
}
