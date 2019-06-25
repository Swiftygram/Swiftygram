//
//  UpdateBasicGroupFullInfo.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Some data from basicGroupFullInfo has been changed
     */
    struct UpdateBasicGroupFullInfo: TDObject.Update {
        /**
         Identifier of a basic group
         */
        public let basicGroupId: Int

        /**
         New full information about the group
         */
        public let basicGroupFullInfo: TDObject.BasicGroupFullInfo

        /**
         Some data from basicGroupFullInfo has been changed

         - Parameter basicGroupId: Identifier of a basic group
         - Parameter basicGroupFullInfo: New full information about the group
         */
        public init(basicGroupId: Int, basicGroupFullInfo: TDObject.BasicGroupFullInfo) {
            self.basicGroupId = basicGroupId
            self.basicGroupFullInfo = basicGroupFullInfo
        }
    }
}
