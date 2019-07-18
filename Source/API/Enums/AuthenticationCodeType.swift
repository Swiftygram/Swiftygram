//
//  AuthenticationCodeType.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDEnum {
    /**
     Provides information about the method by which an authentication code is delivered to the user
     */
    enum AuthenticationCodeType: TDEnumProtocol {
        /**
         An authentication code is delivered via a private Telegram message, which can be viewed in another client

         - length: Length of the code
         */
        case telegramMessage(length: Int)

        /**
         An authentication code is delivered via an SMS message to the specified phone number

         - length: Length of the code
         */
        case sms(length: Int)

        /**
         An authentication code is delivered via a phone call to the specified phone number

         - length: Length of the code
         */
        case call(length: Int)

        /**
         An authentication code is delivered by an immediately cancelled call to the specified phone number. The number from which the call was made is the code

         - pattern: Pattern of the phone number from which the call will be made
         */
        case flashCall(pattern: String)

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let type = try container.decode(String.self, forKey: .type)

            switch type {
            case "authenticationCodeTypeTelegramMessage":
                let length = try container.decode(Int.self, forKey: .init(string: "length"))

                self = .telegramMessage(length: length)

            case "authenticationCodeTypeSms":
                let length = try container.decode(Int.self, forKey: .init(string: "length"))

                self = .sms(length: length)

            case "authenticationCodeTypeCall":
                let length = try container.decode(Int.self, forKey: .init(string: "length"))

                self = .call(length: length)

            case "authenticationCodeTypeFlashCall":
                let pattern = try container.decode(String.self, forKey: .init(string: "pattern"))

                self = .flashCall(pattern: pattern)

            default:
                throw DecodingError.typeMismatch(AuthenticationCodeType.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined AuthenticationCodeType"))
            }
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            switch self {
            case let .telegramMessage(length):
                try container.encode("authenticationCodeTypeTelegramMessage", forKey: .type)

                try container.encode(length, forKey: .init(string: "length"))

            case let .sms(length):
                try container.encode("authenticationCodeTypeSms", forKey: .type)

                try container.encode(length, forKey: .init(string: "length"))

            case let .call(length):
                try container.encode("authenticationCodeTypeCall", forKey: .type)

                try container.encode(length, forKey: .init(string: "length"))

            case let .flashCall(pattern):
                try container.encode("authenticationCodeTypeFlashCall", forKey: .type)

                try container.encode(pattern, forKey: .init(string: "pattern"))
            }
        }
        
        public var isTelegramMessage: Bool {
            if case .telegramMessage = self {
                return true
            } else {
                return false
            }
        }
    }
}
