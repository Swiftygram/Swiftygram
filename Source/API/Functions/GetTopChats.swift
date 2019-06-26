//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns a list of frequently used chats. Supported only if the chat info database is enabled

     - ReturnType: `TDObject.Chats`
     */
    struct GetTopChats: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Chats

        /**
         Category of chats to be returned
         */
        public var category: TDEnum.TopChatCategory

        /**
         Maximum number of chats to be returned; up to 30
         */
        public var limit: Int

        /**
         Returns a list of frequently used chats. Supported only if the chat info database is enabled

         - Parameter category: Category of chats to be returned
         - Parameter limit: Maximum number of chats to be returned; up to 30
         */
        public init(category: TDEnum.TopChatCategory, limit: Int) {
            self.category = category
            self.limit = limit
        }
    }
}
