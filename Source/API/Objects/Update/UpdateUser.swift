//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Some data of a user has changed. This update is guaranteed to come before the user identifier is returned to the client
     */
    struct UpdateUser: TDObject.Update {
        /**
         New data about the user
         */
        public var user: TDObject.User

        /**
         Some data of a user has changed. This update is guaranteed to come before the user identifier is returned to the client

         - Parameter user: New data about the user
         */
        public init(user: TDObject.User) {
            self.user = user
        }
    }
}
