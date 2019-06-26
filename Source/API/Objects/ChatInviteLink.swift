//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains a chat invite link
     */
    struct ChatInviteLink: TDObjectProtocol {
        /**
         Chat invite link
         */
        public var inviteLink: String

        /**
         Contains a chat invite link

         - Parameter inviteLink: Chat invite link
         */
        public init(inviteLink: String) {
            self.inviteLink = inviteLink
        }
    }
}
