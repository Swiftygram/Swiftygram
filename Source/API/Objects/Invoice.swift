//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Product invoice
     */
    struct Invoice: TDObjectProtocol {
        /**
         ISO 4217 currency code
         */
        public var currency: String

        /**
         A list of objects used to calculate the total price of the product
         */
        public var priceParts: [TDObject.LabeledPricePart]

        /**
         True, if the payment is a test payment
         */
        public var isTest: Bool

        /**
         True, if the user's name is needed for payment
         */
        public var needName: Bool

        /**
         True, if the user's phone number is needed for payment
         */
        public var needPhoneNumber: Bool

        /**
         True, if the user's email address is needed for payment
         */
        public var needEmailAddress: Bool

        /**
         True, if the user's shipping address is needed for payment
         */
        public var needShippingAddress: Bool

        /**
         True, if the user's phone number will be sent to the provider
         */
        public var sendPhoneNumberToProvider: Bool

        /**
         True, if the user's email address will be sent to the provider
         */
        public var sendEmailAddressToProvider: Bool

        /**
         True, if the total price depends on the shipping method
         */
        public var isFlexible: Bool

        /**
         Product invoice

         - Parameter currency: ISO 4217 currency code
         - Parameter priceParts: A list of objects used to calculate the total price of the product
         - Parameter isTest: True, if the payment is a test payment
         - Parameter needName: True, if the user's name is needed for payment
         - Parameter needPhoneNumber: True, if the user's phone number is needed for payment
         - Parameter needEmailAddress: True, if the user's email address is needed for payment
         - Parameter needShippingAddress: True, if the user's shipping address is needed for payment
         - Parameter sendPhoneNumberToProvider: True, if the user's phone number will be sent to the provider
         - Parameter sendEmailAddressToProvider: True, if the user's email address will be sent to the provider
         - Parameter isFlexible: True, if the total price depends on the shipping method
         */
        public init(currency: String, priceParts: [TDObject.LabeledPricePart], isTest: Bool, needName: Bool, needPhoneNumber: Bool, needEmailAddress: Bool, needShippingAddress: Bool, sendPhoneNumberToProvider: Bool, sendEmailAddressToProvider: Bool, isFlexible: Bool) {
            self.currency = currency
            self.priceParts = priceParts
            self.isTest = isTest
            self.needName = needName
            self.needPhoneNumber = needPhoneNumber
            self.needEmailAddress = needEmailAddress
            self.needShippingAddress = needShippingAddress
            self.sendPhoneNumberToProvider = sendPhoneNumberToProvider
            self.sendEmailAddressToProvider = sendEmailAddressToProvider
            self.isFlexible = isFlexible
        }
    }
}
