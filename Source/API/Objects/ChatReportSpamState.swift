//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains information about the availability of the "Report spam" action for a chat
     */
    struct ChatReportSpamState: TDObjectProtocol {
        /**
         True, if a prompt with the "Report spam" action should be shown to the user
         */
        public var canReportSpam: Bool

        /**
         Contains information about the availability of the "Report spam" action for a chat

         - Parameter canReportSpam: True, if a prompt with the "Report spam" action should be shown to the user
         */
        public init(canReportSpam: Bool) {
            self.canReportSpam = canReportSpam
        }
    }
}
