//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns an invoice payment form. This method should be called when the user presses inlineKeyboardButtonBuy

     - ReturnType: `TDObject.PaymentForm`
     */
    struct GetPaymentForm: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.PaymentForm

        /**
         Chat identifier of the Invoice message
         */
        public var chatId: Int64

        /**
         Message identifier
         */
        public var messageId: Int64

        /**
         Returns an invoice payment form. This method should be called when the user presses inlineKeyboardButtonBuy

         - Parameter chatId: Chat identifier of the Invoice message
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
