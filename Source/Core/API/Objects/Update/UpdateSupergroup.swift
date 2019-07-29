//
//  UpdateSupergroup.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Some data of a supergroup or a channel has changed. This update is guaranteed to come before the supergroup identifier is returned to the client
     */
    struct UpdateSupergroup: TDObject.Update {
        /**
         New data about the supergroup
         */
        public var supergroup: TDObject.Supergroup

        /**
         Some data of a supergroup or a channel has changed. This update is guaranteed to come before the supergroup identifier is returned to the client

         - Parameter supergroup: New data about the supergroup
         */
        public init(supergroup: TDObject.Supergroup) {
            self.supergroup = supergroup
        }
    }
}
