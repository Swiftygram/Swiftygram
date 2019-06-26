//
//  PaymentResult.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains the result of a payment request
     */
    struct PaymentResult: TDObjectProtocol {
        /**
         True, if the payment request was successful; otherwise the verification_url will be not empty
         */
        public let success: Bool

        /**
         URL for additional payment credentials verification
         */
        public let verificationUrl: URL

        /**
         Contains the result of a payment request

         - Parameter success: True, if the payment request was successful; otherwise the verification_url will be not empty
         - Parameter verificationUrl: URL for additional payment credentials verification
         */
        public init(success: Bool, verificationUrl: URL) {
            self.success = success
            self.verificationUrl = verificationUrl
        }
    }
}
