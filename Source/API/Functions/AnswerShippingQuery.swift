//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Sets the result of a shipping query; for bots only

     - ReturnType: `TDObject.Ok`
     */
    struct AnswerShippingQuery: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Identifier of the shipping query
         */
        public var shippingQueryId: Int64

        /**
         Available shipping options
         */
        public var shippingOptions: [TDObject.ShippingOption]

        /**
         An error message, empty on success
         */
        public var errorMessage: String

        /**
         Sets the result of a shipping query; for bots only

         - Parameter shippingQueryId: Identifier of the shipping query
         - Parameter shippingOptions: Available shipping options
         - Parameter errorMessage: An error message, empty on success
         */
        public init(shippingQueryId: Int64, shippingOptions: [TDObject.ShippingOption], errorMessage: String) {
            self.shippingQueryId = shippingQueryId
            self.shippingOptions = shippingOptions
            self.errorMessage = errorMessage
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            shippingQueryId = try container.decodeInt64(forKey: .init(string: "shippingQueryId"))
            shippingOptions = try container.decode([TDObject.ShippingOption].self, forKey: .init(string: "shippingOptions"))
            errorMessage = try container.decode(String.self, forKey: .init(string: "errorMessage"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(shippingQueryId, forKey: .init(string: "shippingQueryId"))
            try container.encode(shippingOptions, forKey: .init(string: "shippingOptions"))
            try container.encode(errorMessage, forKey: .init(string: "errorMessage"))
        }
    }
}
