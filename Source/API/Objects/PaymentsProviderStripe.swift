//
//  PaymentsProviderStripe.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Stripe payment provider
     */
    struct PaymentsProviderStripe: TDObjectProtocol {
        /**
         Stripe API publishable key
         */
        public var publishableKey: String

        /**
         True, if the user country must be provided
         */
        public var needCountry: Bool

        /**
         True, if the user ZIP/postal code must be provided
         */
        public var needPostalCode: Bool

        /**
         True, if the cardholder name must be provided
         */
        public var needCardholderName: Bool

        /**
         Stripe payment provider

         - Parameter publishableKey: Stripe API publishable key
         - Parameter needCountry: True, if the user country must be provided
         - Parameter needPostalCode: True, if the user ZIP/postal code must be provided
         - Parameter needCardholderName: True, if the cardholder name must be provided
         */
        public init(publishableKey: String, needCountry: Bool, needPostalCode: Bool, needCardholderName: Bool) {
            self.publishableKey = publishableKey
            self.needCountry = needCountry
            self.needPostalCode = needPostalCode
            self.needCardholderName = needCardholderName
        }
    }
}
