//
//  UpdateSupergroupFullInfo.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Some data from supergroupFullInfo has been changed
     */
    struct UpdateSupergroupFullInfo: TDObject.Update {
        /**
         Identifier of the supergroup or channel
         */
        public var supergroupId: Int

        /**
         New full information about the supergroup
         */
        public var supergroupFullInfo: TDObject.SupergroupFullInfo

        /**
         Some data from supergroupFullInfo has been changed

         - Parameter supergroupId: Identifier of the supergroup or channel
         - Parameter supergroupFullInfo: New full information about the supergroup
         */
        public init(supergroupId: Int, supergroupFullInfo: TDObject.SupergroupFullInfo) {
            self.supergroupId = supergroupId
            self.supergroupFullInfo = supergroupFullInfo
        }
    }
}
