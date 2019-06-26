//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains information about the current recovery email address
     */
    struct RecoveryEmailAddress: TDObjectProtocol {
        /**
         Recovery email address
         */
        public var recoveryEmailAddress: String

        /**
         Contains information about the current recovery email address

         - Parameter recoveryEmailAddress: Recovery email address
         */
        public init(recoveryEmailAddress: String) {
            self.recoveryEmailAddress = recoveryEmailAddress
        }
    }
}
