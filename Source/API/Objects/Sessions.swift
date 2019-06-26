//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains a list of sessions
     */
    struct Sessions: TDObjectProtocol {
        /**
         List of sessions
         */
        public var sessions: [TDObject.Session]

        /**
         Contains a list of sessions

         - Parameter sessions: List of sessions
         */
        public init(sessions: [TDObject.Session]) {
            self.sessions = sessions
        }
    }
}
