//
//  UpdateBasicGroup.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Some data of a basic group has changed. This update is guaranteed to come before the basic group identifier is returned to the client
     */
    struct UpdateBasicGroup: TDObject.Update {
        /**
         New data about the group
         */
        public var basicGroup: TDObject.BasicGroup

        /**
         Some data of a basic group has changed. This update is guaranteed to come before the basic group identifier is returned to the client

         - Parameter basicGroup: New data about the group
         */
        public init(basicGroup: TDObject.BasicGroup) {
            self.basicGroup = basicGroup
        }
    }
}
