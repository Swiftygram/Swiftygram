//
//  MessageSendingState.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDEnum {
    /**
     Contains information about the sending state of the message
     */
    enum MessageSendingState: TDEnumProtocol {
        /**
         The message is being sent now, but has not yet been delivered to the server
         */
        case pending

        /**
         The message failed to be sent
         */
        case failed

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let type = try container.decode(String.self, forKey: .type)

            switch type {
            case "messageSendingStatePending":
                self = .pending

            case "messageSendingStateFailed":
                self = .failed

            default:
                throw DecodingError.typeMismatch(MessageSendingState.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined MessageSendingState"))
            }
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            switch self {
            case .pending:
                try container.encode("messageSendingStatePending", forKey: .type)

            case .failed:
                try container.encode("messageSendingStateFailed", forKey: .type)
            }
        }
    }
}
