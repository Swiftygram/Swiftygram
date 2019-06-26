//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Succeeds after a specified amount of time has passed. Can be called before authorization. Can be called before initialization

     - ReturnType: `TDObject.Ok`
     */
    struct SetAlarm: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Number of seconds before the function returns
         */
        public var seconds: Double

        /**
         Succeeds after a specified amount of time has passed. Can be called before authorization. Can be called before initialization

         - Parameter seconds: Number of seconds before the function returns
         */
        public init(seconds: Double) {
            self.seconds = seconds
        }
    }
}
