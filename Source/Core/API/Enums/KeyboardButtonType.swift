//
//  KeyboardButtonType.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDEnum {
    /**
     Describes a keyboard button type
     */
    enum KeyboardButtonType: TDEnumProtocol {
        /**
         A simple button, with text that should be sent when the button is pressed
         */
        case text

        /**
         A button that sends the user's phone number when pressed; available only in private chats
         */
        case requestPhoneNumber

        /**
         A button that sends the user's location when pressed; available only in private chats
         */
        case requestLocation

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let type = try container.decode(String.self, forKey: .type)

            switch type {
            case "keyboardButtonTypeText":
                self = .text

            case "keyboardButtonTypeRequestPhoneNumber":
                self = .requestPhoneNumber

            case "keyboardButtonTypeRequestLocation":
                self = .requestLocation

            default:
                throw DecodingError.typeMismatch(KeyboardButtonType.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined KeyboardButtonType"))
            }
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            switch self {
            case .text:
                try container.encode("keyboardButtonTypeText", forKey: .type)

            case .requestPhoneNumber:
                try container.encode("keyboardButtonTypeRequestPhoneNumber", forKey: .type)

            case .requestLocation:
                try container.encode("keyboardButtonTypeRequestLocation", forKey: .type)
            }
        }

        public var isText: Bool {
            if case .text = self {
                return true
            } else {
                return false
            }
        }

        public var isRequestPhoneNumber: Bool {
            if case .requestPhoneNumber = self {
                return true
            } else {
                return false
            }
        }

        public var isRequestLocation: Bool {
            if case .requestLocation = self {
                return true
            } else {
                return false
            }
        }
    }
}
