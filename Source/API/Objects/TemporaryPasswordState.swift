//
//  TemporaryPasswordState.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Returns information about the availability of a temporary password, which can be used for payments
     */
    struct TemporaryPasswordState: TDObjectProtocol {
        /**
         True, if a temporary password is available
         */
        public let hasPassword: Bool

        /**
         Time left before the temporary password expires, in seconds
         */
        public let validFor: Int

        /**
         Returns information about the availability of a temporary password, which can be used for payments

         - Parameter hasPassword: True, if a temporary password is available
         - Parameter validFor: Time left before the temporary password expires, in seconds
         */
        public init(hasPassword: Bool, validFor: Int) {
            self.hasPassword = hasPassword
            self.validFor = validFor
        }
    }
}
