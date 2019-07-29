//
//  ValidateOrderInfo.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Validates the order information provided by a user and returns the available shipping options for a flexible invoice

     - ReturnType: `TDObject.ValidatedOrderInfo`
     */
    struct ValidateOrderInfo: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.ValidatedOrderInfo

        /**
         Chat identifier of the Invoice message
         */
        public var chatId: Int64

        /**
         Message identifier
         */
        public var messageId: Int64

        /**
         The order information, provided by the user
         */
        public var orderInfo: TDObject.OrderInfo

        /**
         True, if the order information can be saved
         */
        public var allowSave: Bool

        /**
         Validates the order information provided by a user and returns the available shipping options for a flexible invoice

         - Parameter chatId: Chat identifier of the Invoice message
         - Parameter messageId: Message identifier
         - Parameter orderInfo: The order information, provided by the user
         - Parameter allowSave: True, if the order information can be saved
         */
        public init(chatId: Int64, messageId: Int64, orderInfo: TDObject.OrderInfo, allowSave: Bool) {
            self.chatId = chatId
            self.messageId = messageId
            self.orderInfo = orderInfo
            self.allowSave = allowSave
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            messageId = try container.decodeInt64(forKey: .init(string: "messageId"))
            orderInfo = try container.decode(TDObject.OrderInfo.self, forKey: .init(string: "orderInfo"))
            allowSave = try container.decode(Bool.self, forKey: .init(string: "allowSave"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encodeInt64(messageId, forKey: .init(string: "messageId"))
            try container.encode(orderInfo, forKey: .init(string: "orderInfo"))
            try container.encode(allowSave, forKey: .init(string: "allowSave"))
        }
    }
}
