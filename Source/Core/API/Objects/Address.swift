//
//  Address.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
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
        public var countryCode: String

        /**
         State, if applicable
         */
        public var state: String?

        /**
         City
         */
        public var city: String

        /**
         First line of the address
         */
        public var streetLine1: String

        /**
         Second line of the address
         */
        public var streetLine2: String

        /**
         Address postal code
         */
        public var postalCode: String

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
