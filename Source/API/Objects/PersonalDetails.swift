//
//  PersonalDetails.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains the user's personal details
     */
    struct PersonalDetails: TDObjectProtocol {
        /**
         First name of the user written in English; 1-255 characters
         */
        public let firstName: String

        /**
         Middle name of the user written in English; 0-255 characters
         */
        public let middleName: String

        /**
         Last name of the user written in English; 1-255 characters
         */
        public let lastName: String

        /**
         Native first name of the user; 1-255 characters
         */
        public let nativeFirstName: String

        /**
         Native middle name of the user; 0-255 characters
         */
        public let nativeMiddleName: String

        /**
         Native last name of the user; 1-255 characters
         */
        public let nativeLastName: String

        /**
         Birthdate of the user
         */
        public let birthdate: TDObject.Date

        /**
         Gender of the user, "male" or "female"
         */
        public let gender: String

        /**
         A two-letter ISO 3166-1 alpha-2 country code of the user's country
         */
        public let countryCode: String

        /**
         A two-letter ISO 3166-1 alpha-2 country code of the user's residence country
         */
        public let residenceCountryCode: String

        /**
         Contains the user's personal details

         - Parameter firstName: First name of the user written in English; 1-255 characters
         - Parameter middleName: Middle name of the user written in English; 0-255 characters
         - Parameter lastName: Last name of the user written in English; 1-255 characters
         - Parameter nativeFirstName: Native first name of the user; 1-255 characters
         - Parameter nativeMiddleName: Native middle name of the user; 0-255 characters
         - Parameter nativeLastName: Native last name of the user; 1-255 characters
         - Parameter birthdate: Birthdate of the user
         - Parameter gender: Gender of the user, "male" or "female"
         - Parameter countryCode: A two-letter ISO 3166-1 alpha-2 country code of the user's country
         - Parameter residenceCountryCode: A two-letter ISO 3166-1 alpha-2 country code of the user's residence country
         */
        public init(firstName: String, middleName: String, lastName: String, nativeFirstName: String, nativeMiddleName: String, nativeLastName: String, birthdate: TDObject.Date, gender: String, countryCode: String, residenceCountryCode: String) {
            self.firstName = firstName
            self.middleName = middleName
            self.lastName = lastName
            self.nativeFirstName = nativeFirstName
            self.nativeMiddleName = nativeMiddleName
            self.nativeLastName = nativeLastName
            self.birthdate = birthdate
            self.gender = gender
            self.countryCode = countryCode
            self.residenceCountryCode = residenceCountryCode
        }
    }
}
