//
//  PaymentReceipt.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains information about a successful payment
     */
    struct PaymentReceipt: TDObjectProtocol {
        /**
         Point in time (Unix timestamp) when the payment was made
         */
        public let date: Foundation.Date

        /**
         User identifier of the payment provider bot
         */
        public let paymentsProviderUserId: Int

        /**
         Contains information about the invoice
         */
        public let invoice: TDObject.Invoice

        /**
         Contains order information; may be null
         */
        public let orderInfo: TDObject.OrderInfo

        /**
         Chosen shipping option; may be null
         */
        public let shippingOption: TDObject.ShippingOption

        /**
         Title of the saved credentials
         */
        public let credentialsTitle: String

        /**
         Contains information about a successful payment

         - Parameter date: Point in time (Unix timestamp) when the payment was made
         - Parameter paymentsProviderUserId: User identifier of the payment provider bot
         - Parameter invoice: Contains information about the invoice
         - Parameter orderInfo: Contains order information; may be null
         - Parameter shippingOption: Chosen shipping option; may be null
         - Parameter credentialsTitle: Title of the saved credentials
         */
        public init(date: Foundation.Date, paymentsProviderUserId: Int, invoice: TDObject.Invoice, orderInfo: TDObject.OrderInfo, shippingOption: TDObject.ShippingOption, credentialsTitle: String) {
            self.date = date
            self.paymentsProviderUserId = paymentsProviderUserId
            self.invoice = invoice
            self.orderInfo = orderInfo
            self.shippingOption = shippingOption
            self.credentialsTitle = credentialsTitle
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            date = try container.decodeDate(forKey: .init(string: "date"))
            paymentsProviderUserId = try container.decode(Int.self, forKey: .init(string: "paymentsProviderUserId"))
            invoice = try container.decode(TDObject.Invoice.self, forKey: .init(string: "invoice"))
            orderInfo = try container.decode(TDObject.OrderInfo.self, forKey: .init(string: "orderInfo"))
            shippingOption = try container.decode(TDObject.ShippingOption.self, forKey: .init(string: "shippingOption"))
            credentialsTitle = try container.decode(String.self, forKey: .init(string: "credentialsTitle"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeDate(date, forKey: .init(string: "date"))
            try container.encode(paymentsProviderUserId, forKey: .init(string: "paymentsProviderUserId"))
            try container.encode(invoice, forKey: .init(string: "invoice"))
            try container.encode(orderInfo, forKey: .init(string: "orderInfo"))
            try container.encode(shippingOption, forKey: .init(string: "shippingOption"))
            try container.encode(credentialsTitle, forKey: .init(string: "credentialsTitle"))
        }
    }
}
