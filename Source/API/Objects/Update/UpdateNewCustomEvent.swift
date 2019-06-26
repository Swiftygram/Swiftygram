//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     A new incoming event; for bots only
     */
    struct UpdateNewCustomEvent: TDObject.Update {
        /**
         A JSON-serialized event
         */
        public var event: String

        /**
         A new incoming event; for bots only

         - Parameter event: A JSON-serialized event
         */
        public init(event: String) {
            self.event = event
        }
    }
}
