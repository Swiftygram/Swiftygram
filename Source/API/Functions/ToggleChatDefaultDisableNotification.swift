//
//  ToggleChatDefaultDisableNotification.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Changes the value of the default disable_notification parameter, used when a message is sent to a chat

     - ReturnType: `TDObject.Ok`
     */
    struct ToggleChatDefaultDisableNotification: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Chat identifier
         */
        public let chatId: Int64

        /**
         New value of default_disable_notification
         */
        public let defaultDisableNotification: Bool

        /**
         Changes the value of the default disable_notification parameter, used when a message is sent to a chat

         - Parameter chatId: Chat identifier
         - Parameter defaultDisableNotification: New value of default_disable_notification
         */
        public init(chatId: Int64, defaultDisableNotification: Bool) {
            self.chatId = chatId
            self.defaultDisableNotification = defaultDisableNotification
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            defaultDisableNotification = try container.decode(Bool.self, forKey: .init(string: "defaultDisableNotification"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encode(defaultDisableNotification, forKey: .init(string: "defaultDisableNotification"))
        }
    }
}
