//
//  DeleteSupergroup.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Deletes a supergroup or channel along with all messages in the corresponding chat. This will release the supergroup or channel username and remove all members; requires creator privileges in the supergroup or channel. Chats with more than 1000 members can't be deleted using this method

     - ReturnType: `TDObject.Ok`
     */
    struct DeleteSupergroup: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Identifier of the supergroup or channel
         */
        public var supergroupId: Int

        /**
         Deletes a supergroup or channel along with all messages in the corresponding chat. This will release the supergroup or channel username and remove all members; requires creator privileges in the supergroup or channel. Chats with more than 1000 members can't be deleted using this method

         - Parameter supergroupId: Identifier of the supergroup or channel
         */
        public init(supergroupId: Int) {
            self.supergroupId = supergroupId
        }
    }
}
