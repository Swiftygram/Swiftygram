//
//  SendPaymentForm.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Sends a filled-out payment form to the bot for final verification

     - ReturnType: `TDObject.PaymentResult`
     */
    struct SendPaymentForm: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.PaymentResult

        /**
         Chat identifier of the Invoice message
         */
        public let chatId: Int64

        /**
         Message identifier
         */
        public let messageId: Int64

        /**
         Identifier returned by ValidateOrderInfo, or an empty string
         */
        public let orderInfoId: String

        /**
         Identifier of a chosen shipping option, if applicable
         */
        public let shippingOptionId: String?

        /**
         The credentials chosen by user for payment
         */
        public let credentials: TDEnum.InputCredentials

        /**
         Sends a filled-out payment form to the bot for final verification

         - Parameter chatId: Chat identifier of the Invoice message
         - Parameter messageId: Message identifier
         - Parameter orderInfoId: Identifier returned by ValidateOrderInfo, or an empty string
         - Parameter shippingOptionId: Identifier of a chosen shipping option, if applicable
         - Parameter credentials: The credentials chosen by user for payment
         */
        public init(chatId: Int64, messageId: Int64, orderInfoId: String, shippingOptionId: String?, credentials: TDEnum.InputCredentials) {
            self.chatId = chatId
            self.messageId = messageId
            self.orderInfoId = orderInfoId
            self.shippingOptionId = shippingOptionId
            self.credentials = credentials
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            messageId = try container.decodeInt64(forKey: .init(string: "messageId"))
            orderInfoId = try container.decode(String.self, forKey: .init(string: "orderInfoId"))
            shippingOptionId = try container.decodeIfPresent(String.self, forKey: .init(string: "shippingOptionId"))
            credentials = try container.decode(TDEnum.InputCredentials.self, forKey: .init(string: "credentials"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encodeInt64(messageId, forKey: .init(string: "messageId"))
            try container.encode(orderInfoId, forKey: .init(string: "orderInfoId"))
            try container.encodeIfPresent(shippingOptionId, forKey: .init(string: "shippingOptionId"))
            try container.encode(credentials, forKey: .init(string: "credentials"))
        }
    }
}
