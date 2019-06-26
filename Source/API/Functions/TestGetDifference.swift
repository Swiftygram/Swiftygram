//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Forces an updates.getDifference call to the Telegram servers; for testing only

     - ReturnType: `TDObject.Ok`
     */
    struct TestGetDifference: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Forces an updates.getDifference call to the Telegram servers; for testing only
         */
        public init() {}
    }
}
