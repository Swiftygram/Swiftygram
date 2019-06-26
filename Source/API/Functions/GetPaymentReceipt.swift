//
//  GetPaymentReceipt.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns information about a successful payment

     - ReturnType: `TDObject.PaymentReceipt`
     */
    struct GetPaymentReceipt: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.PaymentReceipt

        /**
         Chat identifier of the PaymentSuccessful message
         */
        public let chatId: Int64

        /**
         Message identifier
         */
        public let messageId: Int64

        /**
         Returns information about a successful payment

         - Parameter chatId: Chat identifier of the PaymentSuccessful message
         - Parameter messageId: Message identifier
         */
        public init(chatId: Int64, messageId: Int64) {
            self.chatId = chatId
            self.messageId = messageId
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            messageId = try container.decodeInt64(forKey: .init(string: "messageId"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encodeInt64(messageId, forKey: .init(string: "messageId"))
        }
    }
}
