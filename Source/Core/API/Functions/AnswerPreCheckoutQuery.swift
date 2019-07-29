//
//  AnswerPreCheckoutQuery.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Sets the result of a pre-checkout query; for bots only

     - ReturnType: `TDObject.Ok`
     */
    struct AnswerPreCheckoutQuery: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Identifier of the pre-checkout query
         */
        public var preCheckoutQueryId: Int64

        /**
         An error message, empty on success
         */
        public var errorMessage: String

        /**
         Sets the result of a pre-checkout query; for bots only

         - Parameter preCheckoutQueryId: Identifier of the pre-checkout query
         - Parameter errorMessage: An error message, empty on success
         */
        public init(preCheckoutQueryId: Int64, errorMessage: String) {
            self.preCheckoutQueryId = preCheckoutQueryId
            self.errorMessage = errorMessage
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            preCheckoutQueryId = try container.decodeInt64(forKey: .init(string: "preCheckoutQueryId"))
            errorMessage = try container.decode(String.self, forKey: .init(string: "errorMessage"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(preCheckoutQueryId, forKey: .init(string: "preCheckoutQueryId"))
            try container.encode(errorMessage, forKey: .init(string: "errorMessage"))
        }
    }
}
