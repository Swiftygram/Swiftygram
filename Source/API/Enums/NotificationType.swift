//
//  NotificationType.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDEnum {
    /**
     Contains detailed information about a notification
     */
    enum NotificationType: TDEnumProtocol {
        /**
         New message was received

         - message: The message
         */
        case newMessage(message: TDObject.Message)

        /**
         New secret chat was created
         */
        case newSecretChat

        /**
         New call was received

         - callId: Call identifier
         */
        case newCall(callId: Int)

        /**
         New message was received through a push notification

         - messageId: The message identifier. The message will not be available in the chat history, but the ID can be used in viewMessages and as reply_to_message_id
         - senderUserId: Sender of the message. Corresponding user may be inaccessible
         - content: Push message content
         */
        case newPushMessage(messageId: Int64, senderUserId: Int, content: TDEnum.PushMessageContent)

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let type = try container.decode(String.self, forKey: .type)

            switch type {
            case "notificationTypeNewMessage":
                let message = try container.decode(TDObject.Message.self, forKey: .init(string: "message"))

                self = .newMessage(message: message)

            case "notificationTypeNewSecretChat":
                self = .newSecretChat

            case "notificationTypeNewCall":
                let callId = try container.decode(Int.self, forKey: .init(string: "callId"))

                self = .newCall(callId: callId)

            case "notificationTypeNewPushMessage":
                let messageId = try container.decodeInt64(forKey: .init(string: "messageId"))
                let senderUserId = try container.decode(Int.self, forKey: .init(string: "senderUserId"))
                let content = try container.decode(TDEnum.PushMessageContent.self, forKey: .init(string: "content"))

                self = .newPushMessage(messageId: messageId, senderUserId: senderUserId, content: content)

            default:
                throw DecodingError.typeMismatch(NotificationType.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined NotificationType"))
            }
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            switch self {
            case let .newMessage(message):
                try container.encode("notificationTypeNewMessage", forKey: .type)

                try container.encode(message, forKey: .init(string: "message"))

            case .newSecretChat:
                try container.encode("notificationTypeNewSecretChat", forKey: .type)

            case let .newCall(callId):
                try container.encode("notificationTypeNewCall", forKey: .type)

                try container.encode(callId, forKey: .init(string: "callId"))

            case let .newPushMessage(messageId, senderUserId, content):
                try container.encode("notificationTypeNewPushMessage", forKey: .type)

                try container.encodeInt64(messageId, forKey: .init(string: "messageId"))
                try container.encode(senderUserId, forKey: .init(string: "senderUserId"))
                try container.encode(content, forKey: .init(string: "content"))
            }
        }
    }
}
