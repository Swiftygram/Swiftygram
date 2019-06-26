//
//  CreateNewBasicGroupChat.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Creates a new basic group and sends a corresponding messageBasicGroupChatCreate. Returns the newly created chat

     - ReturnType: `TDObject.Chat`
     */
    struct CreateNewBasicGroupChat: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Chat

        /**
         Identifiers of users to be added to the basic group
         */
        public let userIds: [Int]

        /**
         Title of the new basic group; 1-128 characters
         */
        public let title: String

        /**
         Creates a new basic group and sends a corresponding messageBasicGroupChatCreate. Returns the newly created chat

         - Parameter userIds: Identifiers of users to be added to the basic group
         - Parameter title: Title of the new basic group; 1-128 characters
         */
        public init(userIds: [Int], title: String) {
            self.userIds = userIds
            self.title = title
        }
    }
}
