//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDEnum {
    /**
     Represents the value of an option
     */
    enum OptionValue: TDEnumProtocol {
        /**
         Represents a boolean option

         - value: The value of the option
         */
        case boolean(value: Bool)

        /**
         Represents an unknown option or an option which has a default value
         */
        case empty

        /**
         Represents an integer option

         - value: The value of the option
         */
        case integer(value: Int)

        /**
         Represents a string option

         - value: The value of the option
         */
        case string(value: String)

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let type = try container.decode(String.self, forKey: .type)

            switch type {
            case "optionValueBoolean":
                let value = try container.decode(Bool.self, forKey: .init(string: "value"))

                self = .boolean(value: value)

            case "optionValueEmpty":
                self = .empty

            case "optionValueInteger":
                let value = try container.decode(Int.self, forKey: .init(string: "value"))

                self = .integer(value: value)

            case "optionValueString":
                let value = try container.decode(String.self, forKey: .init(string: "value"))

                self = .string(value: value)

            default:
                throw DecodingError.typeMismatch(OptionValue.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined OptionValue"))
            }
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            switch self {
            case let .boolean(value):
                try container.encode("optionValueBoolean", forKey: .type)

                try container.encode(value, forKey: .init(string: "value"))

            case .empty:
                try container.encode("optionValueEmpty", forKey: .type)

            case let .integer(value):
                try container.encode("optionValueInteger", forKey: .type)

                try container.encode(value, forKey: .init(string: "value"))

            case let .string(value):
                try container.encode("optionValueString", forKey: .type)

                try container.encode(value, forKey: .init(string: "value"))
            }
        }
    }
}
