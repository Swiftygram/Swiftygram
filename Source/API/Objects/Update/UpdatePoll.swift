//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Information about a poll was updated; for bots only
     */
    struct UpdatePoll: TDObject.Update {
        /**
         New data about the poll
         */
        public var poll: TDObject.Poll

        /**
         Information about a poll was updated; for bots only

         - Parameter poll: New data about the poll
         */
        public init(poll: TDObject.Poll) {
            self.poll = poll
        }
    }
}
