//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns the received vector of objects containing a number; for testing only. This is an offline method. Can be called before authorization

     - ReturnType: `TDObject.TestVectorIntObject`
     */
    struct TestCallVectorIntObject: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.TestVectorIntObject

        /**
         Vector of objects to return
         */
        public var x: [TDObject.TestInt]

        /**
         Returns the received vector of objects containing a number; for testing only. This is an offline method. Can be called before authorization

         - Parameter x: Vector of objects to return
         */
        public init(x: [TDObject.TestInt]) {
            self.x = x
        }
    }
}
