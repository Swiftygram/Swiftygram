//
//  OrderInfo.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Order information
     */
    struct OrderInfo: TDObjectProtocol {
        /**
         Name of the user
         */
        public var name: String

        /**
         Phone number of the user
         */
        public var phoneNumber: String

        /**
         Email address of the user
         */
        public var emailAddress: String

        /**
         Shipping address for this order; may be null
         */
        public var shippingAddress: TDObject.Address?

        /**
         Order information

         - Parameter name: Name of the user
         - Parameter phoneNumber: Phone number of the user
         - Parameter emailAddress: Email address of the user
         - Parameter shippingAddress: Shipping address for this order; may be null
         */
        public init(name: String, phoneNumber: String, emailAddress: String, shippingAddress: TDObject.Address?) {
            self.name = name
            self.phoneNumber = phoneNumber
            self.emailAddress = emailAddress
            self.shippingAddress = shippingAddress
        }
    }
}
