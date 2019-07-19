//
//  GetPreferredCountryLanguage.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns an IETF language tag of the language preferred in the country, which should be used to fill native fields in Telegram Passport personal details. Returns a 404 error if unknown

     - ReturnType: `TDObject.Text`
     */
    struct GetPreferredCountryLanguage: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Text

        /**
         A two-letter ISO 3166-1 alpha-2 country code
         */
        public var countryCode: String

        /**
         Returns an IETF language tag of the language preferred in the country, which should be used to fill native fields in Telegram Passport personal details. Returns a 404 error if unknown

         - Parameter countryCode: A two-letter ISO 3166-1 alpha-2 country code
         */
        public init(countryCode: String) {
            self.countryCode = countryCode
        }
    }
}
