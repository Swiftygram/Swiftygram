//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDEnum {
    /**
     Contains information about the origin of a forwarded message
     */
    enum MessageForwardOrigin: TDEnumProtocol {
        /**
         The message was originally written by a known user

         - senderUserId: Identifier of the user that originally sent the message
         */
        case user(senderUserId: Int)

        /**
         The message was originally written by a user, which is hidden by his privacy settings

         - senderName: Name of the sender
         */
        case hiddenUser(senderName: String)

        /**
         The message was originally a post in a channel

         - chatId: Identifier of the chat from which the message was originally forwarded
         - messageId: Message identifier of the original message; 0 if unknown
         - authorSignature: Original post author signature
         */
        case channel(chatId: Int64, messageId: Int64, authorSignature: String)

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let type = try container.decode(String.self, forKey: .type)

            switch type {
            case "messageForwardOriginUser":
                let senderUserId = try container.decode(Int.self, forKey: .init(string: "senderUserId"))

                self = .user(senderUserId: senderUserId)

            case "messageForwardOriginHiddenUser":
                let senderName = try container.decode(String.self, forKey: .init(string: "senderName"))

                self = .hiddenUser(senderName: senderName)

            case "messageForwardOriginChannel":
                let chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
                let messageId = try container.decodeInt64(forKey: .init(string: "messageId"))
                let authorSignature = try container.decode(String.self, forKey: .init(string: "authorSignature"))

                self = .channel(chatId: chatId, messageId: messageId, authorSignature: authorSignature)

            default:
                throw DecodingError.typeMismatch(MessageForwardOrigin.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined MessageForwardOrigin"))
            }
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            switch self {
            case let .user(senderUserId):
                try container.encode("messageForwardOriginUser", forKey: .type)

                try container.encode(senderUserId, forKey: .init(string: "senderUserId"))

            case let .hiddenUser(senderName):
                try container.encode("messageForwardOriginHiddenUser", forKey: .type)

                try container.encode(senderName, forKey: .init(string: "senderName"))

            case let .channel(chatId, messageId, authorSignature):
                try container.encode("messageForwardOriginChannel", forKey: .type)

                try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
                try container.encodeInt64(messageId, forKey: .init(string: "messageId"))
                try container.encode(authorSignature, forKey: .init(string: "authorSignature"))
            }
        }
    }
}
