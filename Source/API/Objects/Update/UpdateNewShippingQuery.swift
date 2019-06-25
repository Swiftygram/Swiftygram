//
//  UpdateNewShippingQuery.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     A new incoming shipping query; for bots only. Only for invoices with flexible price
     */
    struct UpdateNewShippingQuery: TDObject.Update {
        /**
         Unique query identifier
         */
        public let id: Int64

        /**
         Identifier of the user who sent the query
         */
        public let senderUserId: Int

        /**
         Invoice payload
         */
        public let invoicePayload: String

        /**
         User shipping address
         */
        public let shippingAddress: TDObject.Address

        /**
         A new incoming shipping query; for bots only. Only for invoices with flexible price

         - Parameter id: Unique query identifier
         - Parameter senderUserId: Identifier of the user who sent the query
         - Parameter invoicePayload: Invoice payload
         - Parameter shippingAddress: User shipping address
         */
        public init(id: Int64, senderUserId: Int, invoicePayload: String, shippingAddress: TDObject.Address) {
            self.id = id
            self.senderUserId = senderUserId
            self.invoicePayload = invoicePayload
            self.shippingAddress = shippingAddress
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            id = try container.decodeInt64(forKey: .init(string: "id"))
            senderUserId = try container.decode(Int.self, forKey: .init(string: "senderUserId"))
            invoicePayload = try container.decode(String.self, forKey: .init(string: "invoicePayload"))
            shippingAddress = try container.decode(TDObject.Address.self, forKey: .init(string: "shippingAddress"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(id, forKey: .init(string: "id"))
            try container.encode(senderUserId, forKey: .init(string: "senderUserId"))
            try container.encode(invoicePayload, forKey: .init(string: "invoicePayload"))
            try container.encode(shippingAddress, forKey: .init(string: "shippingAddress"))
        }
    }
}
