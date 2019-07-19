//
//  GetSupergroupMembers.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns information about members or banned users in a supergroup or channel. Can be used only if SupergroupFullInfo.can_get_members == true; additionally, administrator privileges may be required for some filters

     - ReturnType: `TDObject.ChatMembers`
     */
    struct GetSupergroupMembers: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.ChatMembers

        /**
         Identifier of the supergroup or channel
         */
        public var supergroupId: Int

        /**
         The type of users to return. By default, supergroupMembersRecent
         */
        public var filter: TDEnum.SupergroupMembersFilter

        /**
         Number of users to skip
         */
        public var offset: Int

        /**
         The maximum number of users be returned; up to 200
         */
        public var limit: Int

        /**
         Returns information about members or banned users in a supergroup or channel. Can be used only if SupergroupFullInfo.can_get_members == true; additionally, administrator privileges may be required for some filters

         - Parameter supergroupId: Identifier of the supergroup or channel
         - Parameter filter: The type of users to return. By default, supergroupMembersRecent
         - Parameter offset: Number of users to skip
         - Parameter limit: The maximum number of users be returned; up to 200
         */
        public init(supergroupId: Int, filter: TDEnum.SupergroupMembersFilter, offset: Int, limit: Int) {
            self.supergroupId = supergroupId
            self.filter = filter
            self.offset = offset
            self.limit = limit
        }
    }
}
