//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns full information about a basic group by its identifier

     - ReturnType: `TDObject.BasicGroupFullInfo`
     */
    struct GetBasicGroupFullInfo: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.BasicGroupFullInfo

        /**
         Basic group identifier
         */
        public var basicGroupId: Int

        /**
         Returns full information about a basic group by its identifier

         - Parameter basicGroupId: Basic group identifier
         */
        public init(basicGroupId: Int) {
            self.basicGroupId = basicGroupId
        }
    }
}
