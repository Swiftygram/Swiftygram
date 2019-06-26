//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns up to 20 recently used inline bots in the order of their last usage

     - ReturnType: `TDObject.Users`
     */
    struct GetRecentInlineBots: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Users

        /**
         Returns up to 20 recently used inline bots in the order of their last usage
         */
        public init() {}
    }
}
