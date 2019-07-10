//
//  GetSupergroupFullInfo.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns full information about a supergroup or channel by its identifier, cached for up to 1 minute

     - ReturnType: `TDObject.SupergroupFullInfo`
     */
    struct GetSupergroupFullInfo: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.SupergroupFullInfo

        /**
         Supergroup or channel identifier
         */
        public var supergroupId: Int

        /**
         Returns full information about a supergroup or channel by its identifier, cached for up to 1 minute

         - Parameter supergroupId: Supergroup or channel identifier
         */
        public init(supergroupId: Int) {
            self.supergroupId = supergroupId
        }
    }
}
