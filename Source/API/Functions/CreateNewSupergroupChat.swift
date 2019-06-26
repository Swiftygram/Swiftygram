//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Creates a new supergroup or channel and sends a corresponding messageSupergroupChatCreate. Returns the newly created chat

     - ReturnType: `TDObject.Chat`
     */
    struct CreateNewSupergroupChat: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Chat

        /**
         Title of the new chat; 1-128 characters
         */
        public var title: String

        /**
         True, if a channel chat should be created
         */
        public var isChannel: Bool

        /**
         Chat description; 0-255 characters
         */
        public var description: String

        /**
         Creates a new supergroup or channel and sends a corresponding messageSupergroupChatCreate. Returns the newly created chat

         - Parameter title: Title of the new chat; 1-128 characters
         - Parameter isChannel: True, if a channel chat should be created
         - Parameter description: Chat description; 0-255 characters
         */
        public init(title: String, isChannel: Bool, description: String) {
            self.title = title
            self.isChannel = isChannel
            self.description = description
        }
    }
}
