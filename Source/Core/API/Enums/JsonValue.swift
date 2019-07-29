//
//  JsonValue.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDEnum {
    /**
     Represents a JSON value
     */
    indirect enum JsonValue: TDEnumProtocol {
        /**
         Represents a null JSON value
         */
        case null

        /**
         Represents a boolean JSON value

         - value: The value
         */
        case boolean(value: Bool)

        /**
         Represents a numeric JSON value

         - value: The value
         */
        case number(value: Double)

        /**
         Represents a string JSON value

         - value: The value
         */
        case string(value: String)

        /**
         Represents a JSON array

         - values: The list of array elements
         */
        case array(values: [TDEnum.JsonValue])

        /**
         Represents a JSON object

         - members: The list of object members
         */
        case object(members: [TDObject.JsonObjectMember])

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let type = try container.decode(String.self, forKey: .type)

            switch type {
            case "jsonValueNull":
                self = .null

            case "jsonValueBoolean":
                let value = try container.decode(Bool.self, forKey: .init(string: "value"))

                self = .boolean(value: value)

            case "jsonValueNumber":
                let value = try container.decode(Double.self, forKey: .init(string: "value"))

                self = .number(value: value)

            case "jsonValueString":
                let value = try container.decode(String.self, forKey: .init(string: "value"))

                self = .string(value: value)

            case "jsonValueArray":
                let values = try container.decode([TDEnum.JsonValue].self, forKey: .init(string: "values"))

                self = .array(values: values)

            case "jsonValueObject":
                let members = try container.decode([TDObject.JsonObjectMember].self, forKey: .init(string: "members"))

                self = .object(members: members)

            default:
                throw DecodingError.typeMismatch(JsonValue.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined JsonValue"))
            }
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            switch self {
            case .null:
                try container.encode("jsonValueNull", forKey: .type)

            case let .boolean(value):
                try container.encode("jsonValueBoolean", forKey: .type)

                try container.encode(value, forKey: .init(string: "value"))

            case let .number(value):
                try container.encode("jsonValueNumber", forKey: .type)

                try container.encode(value, forKey: .init(string: "value"))

            case let .string(value):
                try container.encode("jsonValueString", forKey: .type)

                try container.encode(value, forKey: .init(string: "value"))

            case let .array(values):
                try container.encode("jsonValueArray", forKey: .type)

                try container.encode(values, forKey: .init(string: "values"))

            case let .object(members):
                try container.encode("jsonValueObject", forKey: .type)

                try container.encode(members, forKey: .init(string: "members"))
            }
        }

        public var isNull: Bool {
            if case .null = self {
                return true
            } else {
                return false
            }
        }

        public var isBoolean: Bool {
            if case .boolean = self {
                return true
            } else {
                return false
            }
        }

        public var isNumber: Bool {
            if case .number = self {
                return true
            } else {
                return false
            }
        }

        public var isString: Bool {
            if case .string = self {
                return true
            } else {
                return false
            }
        }

        public var isArray: Bool {
            if case .array = self {
                return true
            } else {
                return false
            }
        }

        public var isObject: Bool {
            if case .object = self {
                return true
            } else {
                return false
            }
        }
    }
}
