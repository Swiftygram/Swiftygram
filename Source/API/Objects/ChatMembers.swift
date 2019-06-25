//
//  ChatMembers.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains a list of chat members
     */
    struct ChatMembers: TDObjectProtocol {
        /**
         Approximate total count of chat members found
         */
        public let totalCount: Int

        /**
         A list of chat members
         */
        public let members: [TDObject.ChatMember]

        /**
         Contains a list of chat members

         - Parameter totalCount: Approximate total count of chat members found
         - Parameter members: A list of chat members
         */
        public init(totalCount: Int, members: [TDObject.ChatMember]) {
            self.totalCount = totalCount
            self.members = members
        }
    }
}
