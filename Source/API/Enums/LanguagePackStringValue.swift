//
//  LanguagePackStringValue.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDEnum {
    /**
     Represents the value of a string in a language pack
     */
    enum LanguagePackStringValue: TDEnumProtocol {
        /**
         An ordinary language pack string

         - value: String value
         */
        case ordinary(value: String)

        /**
         A language pack string which has different forms based on the number of some object it mentions. See https://www.unicode.org/cldr/charts/latest/supplemental/language_plural_rules.html for more info

         - zeroValue: Value for zero objects
         - oneValue: Value for one object
         - twoValue: Value for two objects
         - fewValue: Value for few objects
         - manyValue: Value for many objects
         - otherValue: Default value
         */
        case pluralized(zeroValue: String, oneValue: String, twoValue: String, fewValue: String, manyValue: String, otherValue: String)

        /**
         A deleted language pack string, the value should be taken from the built-in english language pack
         */
        case deleted

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let type = try container.decode(String.self, forKey: .type)

            switch type {
            case "languagePackStringValueOrdinary":
                let value = try container.decode(String.self, forKey: .init(string: "value"))

                self = .ordinary(value: value)

            case "languagePackStringValuePluralized":
                let zeroValue = try container.decode(String.self, forKey: .init(string: "zeroValue"))
                let oneValue = try container.decode(String.self, forKey: .init(string: "oneValue"))
                let twoValue = try container.decode(String.self, forKey: .init(string: "twoValue"))
                let fewValue = try container.decode(String.self, forKey: .init(string: "fewValue"))
                let manyValue = try container.decode(String.self, forKey: .init(string: "manyValue"))
                let otherValue = try container.decode(String.self, forKey: .init(string: "otherValue"))

                self = .pluralized(zeroValue: zeroValue, oneValue: oneValue, twoValue: twoValue, fewValue: fewValue, manyValue: manyValue, otherValue: otherValue)

            case "languagePackStringValueDeleted":
                self = .deleted

            default:
                throw DecodingError.typeMismatch(LanguagePackStringValue.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined LanguagePackStringValue"))
            }
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            switch self {
            case let .ordinary(value):
                try container.encode("languagePackStringValueOrdinary", forKey: .type)

                try container.encode(value, forKey: .init(string: "value"))

            case let .pluralized(zeroValue, oneValue, twoValue, fewValue, manyValue, otherValue):
                try container.encode("languagePackStringValuePluralized", forKey: .type)

                try container.encode(zeroValue, forKey: .init(string: "zeroValue"))
                try container.encode(oneValue, forKey: .init(string: "oneValue"))
                try container.encode(twoValue, forKey: .init(string: "twoValue"))
                try container.encode(fewValue, forKey: .init(string: "fewValue"))
                try container.encode(manyValue, forKey: .init(string: "manyValue"))
                try container.encode(otherValue, forKey: .init(string: "otherValue"))

            case .deleted:
                try container.encode("languagePackStringValueDeleted", forKey: .type)
            }
        }
    }
}
