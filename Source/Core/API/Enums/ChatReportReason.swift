//
//  ChatReportReason.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDEnum {
    /**
     Describes the reason why a chat is reported
     */
    enum ChatReportReason: TDEnumProtocol {
        /**
         The chat contains spam messages
         */
        case spam

        /**
         The chat promotes violence
         */
        case violence

        /**
         The chat contains pornographic messages
         */
        case pornography

        /**
         The chat has child abuse related content
         */
        case childAbuse

        /**
         The chat contains copyrighted content
         */
        case copyright

        /**
         A custom reason provided by the user

         - text: Report text
         */
        case custom(text: String)

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let type = try container.decode(String.self, forKey: .type)

            switch type {
            case "chatReportReasonSpam":
                self = .spam

            case "chatReportReasonViolence":
                self = .violence

            case "chatReportReasonPornography":
                self = .pornography

            case "chatReportReasonChildAbuse":
                self = .childAbuse

            case "chatReportReasonCopyright":
                self = .copyright

            case "chatReportReasonCustom":
                let text = try container.decode(String.self, forKey: .init(string: "text"))

                self = .custom(text: text)

            default:
                throw DecodingError.typeMismatch(ChatReportReason.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined ChatReportReason"))
            }
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            switch self {
            case .spam:
                try container.encode("chatReportReasonSpam", forKey: .type)

            case .violence:
                try container.encode("chatReportReasonViolence", forKey: .type)

            case .pornography:
                try container.encode("chatReportReasonPornography", forKey: .type)

            case .childAbuse:
                try container.encode("chatReportReasonChildAbuse", forKey: .type)

            case .copyright:
                try container.encode("chatReportReasonCopyright", forKey: .type)

            case let .custom(text):
                try container.encode("chatReportReasonCustom", forKey: .type)

                try container.encode(text, forKey: .init(string: "text"))
            }
        }

        public var isSpam: Bool {
            if case .spam = self {
                return true
            } else {
                return false
            }
        }

        public var isViolence: Bool {
            if case .violence = self {
                return true
            } else {
                return false
            }
        }

        public var isPornography: Bool {
            if case .pornography = self {
                return true
            } else {
                return false
            }
        }

        public var isChildAbuse: Bool {
            if case .childAbuse = self {
                return true
            } else {
                return false
            }
        }

        public var isCopyright: Bool {
            if case .copyright = self {
                return true
            } else {
                return false
            }
        }

        public var isCustom: Bool {
            if case .custom = self {
                return true
            } else {
                return false
            }
        }
    }
}
