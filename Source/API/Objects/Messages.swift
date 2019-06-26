//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains a list of messages
     */
    struct Messages: TDObjectProtocol {
        /**
         Approximate total count of messages found
         */
        public var totalCount: Int

        /**
         List of messages; messages may be null
         */
        public var messages: [TDObject.Message]?

        /**
         Contains a list of messages

         - Parameter totalCount: Approximate total count of messages found
         - Parameter messages: List of messages; messages may be null
         */
        public init(totalCount: Int, messages: [TDObject.Message]?) {
            self.totalCount = totalCount
            self.messages = messages
        }
    }
}
