//
//  RecoveryEmailAddress.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
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
        public let recoveryEmailAddress: String

        /**
         Contains information about the current recovery email address

         - Parameter recoveryEmailAddress: Recovery email address
         */
        public init(recoveryEmailAddress: String) {
            self.recoveryEmailAddress = recoveryEmailAddress
        }
    }
}
