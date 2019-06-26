//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns a user that can be contacted to get support

     - ReturnType: `TDObject.User`
     */
    struct GetSupportUser: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.User

        /**
         Returns a user that can be contacted to get support
         */
        public init() {}
    }
}
