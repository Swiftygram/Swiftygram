//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns information about a basic group by its identifier. This is an offline request if the current user is not a bot

     - ReturnType: `TDObject.BasicGroup`
     */
    struct GetBasicGroup: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.BasicGroup

        /**
         Basic group identifier
         */
        public var basicGroupId: Int

        /**
         Returns information about a basic group by its identifier. This is an offline request if the current user is not a bot

         - Parameter basicGroupId: Basic group identifier
         */
        public init(basicGroupId: Int) {
            self.basicGroupId = basicGroupId
        }
    }
}
