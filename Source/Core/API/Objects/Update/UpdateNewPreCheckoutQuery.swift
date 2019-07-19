//
//  UpdateNewPreCheckoutQuery.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     A new incoming pre-checkout query; for bots only. Contains full information about a checkout
     */
    struct UpdateNewPreCheckoutQuery: TDObject.Update {
        /**
         Unique query identifier
         */
        public var id: Int64

        /**
         Identifier of the user who sent the query
         */
        public var senderUserId: Int

        /**
         Currency for the product price
         */
        public var currency: String

        /**
         Total price for the product, in the minimal quantity of the currency
         */
        public var totalAmount: Int64

        /**
         Invoice payload
         */
        public var invoicePayload: String

        /**
         Identifier of a shipping option chosen by the user; may be empty if not applicable
         */
        public var shippingOptionId: String

        /**
         Information about the order; may be null
         */
        public var orderInfo: TDObject.OrderInfo?

        /**
         A new incoming pre-checkout query; for bots only. Contains full information about a checkout

         - Parameter id: Unique query identifier
         - Parameter senderUserId: Identifier of the user who sent the query
         - Parameter currency: Currency for the product price
         - Parameter totalAmount: Total price for the product, in the minimal quantity of the currency
         - Parameter invoicePayload: Invoice payload
         - Parameter shippingOptionId: Identifier of a shipping option chosen by the user; may be empty if not applicable
         - Parameter orderInfo: Information about the order; may be null
         */
        public init(id: Int64, senderUserId: Int, currency: String, totalAmount: Int64, invoicePayload: String, shippingOptionId: String, orderInfo: TDObject.OrderInfo?) {
            self.id = id
            self.senderUserId = senderUserId
            self.currency = currency
            self.totalAmount = totalAmount
            self.invoicePayload = invoicePayload
            self.shippingOptionId = shippingOptionId
            self.orderInfo = orderInfo
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            id = try container.decodeInt64(forKey: .init(string: "id"))
            senderUserId = try container.decode(Int.self, forKey: .init(string: "senderUserId"))
            currency = try container.decode(String.self, forKey: .init(string: "currency"))
            totalAmount = try container.decodeInt64(forKey: .init(string: "totalAmount"))
            invoicePayload = try container.decode(String.self, forKey: .init(string: "invoicePayload"))
            shippingOptionId = try container.decode(String.self, forKey: .init(string: "shippingOptionId"))
            orderInfo = try container.decodeIfPresent(TDObject.OrderInfo.self, forKey: .init(string: "orderInfo"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(id, forKey: .init(string: "id"))
            try container.encode(senderUserId, forKey: .init(string: "senderUserId"))
            try container.encode(currency, forKey: .init(string: "currency"))
            try container.encodeInt64(totalAmount, forKey: .init(string: "totalAmount"))
            try container.encode(invoicePayload, forKey: .init(string: "invoicePayload"))
            try container.encode(shippingOptionId, forKey: .init(string: "shippingOptionId"))
            try container.encodeIfPresent(orderInfo, forKey: .init(string: "orderInfo"))
        }
    }
}
