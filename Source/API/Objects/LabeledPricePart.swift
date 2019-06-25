//
//  LabeledPricePart.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Portion of the price of a product (e.g., "delivery cost", "tax amount")
     */
    struct LabeledPricePart: TDObjectProtocol {
        /**
         Label for this portion of the product price
         */
        public let label: String

        /**
         Currency amount in minimal quantity of the currency
         */
        public let amount: Int64

        /**
         Portion of the price of a product (e.g., "delivery cost", "tax amount")

         - Parameter label: Label for this portion of the product price
         - Parameter amount: Currency amount in minimal quantity of the currency
         */
        public init(label: String, amount: Int64) {
            self.label = label
            self.amount = amount
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            label = try container.decode(String.self, forKey: .init(string: "label"))
            amount = try container.decodeInt64(forKey: .init(string: "amount"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encode(label, forKey: .init(string: "label"))
            try container.encodeInt64(amount, forKey: .init(string: "amount"))
        }
    }
}
