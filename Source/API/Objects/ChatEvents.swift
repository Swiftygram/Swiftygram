//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains a list of chat events
     */
    struct ChatEvents: TDObjectProtocol {
        /**
         List of events
         */
        public var events: [TDObject.ChatEvent]

        /**
         Contains a list of chat events

         - Parameter events: List of events
         */
        public init(events: [TDObject.ChatEvent]) {
            self.events = events
        }
    }
}
