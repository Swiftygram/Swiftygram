//
//  Address.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Describes an address
     */
    struct Address: TDObjectProtocol {
        /**
         A two-letter ISO 3166-1 alpha-2 country code
         */
        public let countryCode: String

        /**
         State, if applicable
         */
        public let state: String?

        /**
         City
         */
        public let city: String

        /**
         First line of the address
         */
        public let streetLine1: String

        /**
         Second line of the address
         */
        public let streetLine2: String

        /**
         Address postal code
         */
        public let postalCode: String

        /**
         Describes an address

         - Parameter countryCode: A two-letter ISO 3166-1 alpha-2 country code
         - Parameter state: State, if applicable
         - Parameter city: City
         - Parameter streetLine1: First line of the address
         - Parameter streetLine2: Second line of the address
         - Parameter postalCode: Address postal code
         */
        public init(countryCode: String, state: String?, city: String, streetLine1: String, streetLine2: String, postalCode: String) {
            self.countryCode = countryCode
            self.state = state
            self.city = city
            self.streetLine1 = streetLine1
            self.streetLine2 = streetLine2
            self.postalCode = postalCode
        }
    }
}
