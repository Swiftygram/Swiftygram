//
//  GetSupergroup.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns information about a supergroup or channel by its identifier. This is an offline request if the current user is not a bot

     - ReturnType: `TDObject.Supergroup`
     */
    struct GetSupergroup: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Supergroup

        /**
         Supergroup or channel identifier
         */
        public var supergroupId: Int

        /**
         Returns information about a supergroup or channel by its identifier. This is an offline request if the current user is not a bot

         - Parameter supergroupId: Supergroup or channel identifier
         */
        public init(supergroupId: Int) {
            self.supergroupId = supergroupId
        }
    }
}
