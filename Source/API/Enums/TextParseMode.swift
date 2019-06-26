//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDEnum {
    /**
     Describes the way the text should be parsed for TextEntities
     */
    enum TextParseMode: TDEnumProtocol {
        /**
         The text should be parsed in markdown-style
         */
        case markdown

        /**
         The text should be parsed in HTML-style
         */
        case hTML

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let type = try container.decode(String.self, forKey: .type)

            switch type {
            case "textParseModeMarkdown":
                self = .markdown

            case "textParseModeHTML":
                self = .hTML

            default:
                throw DecodingError.typeMismatch(TextParseMode.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined TextParseMode"))
            }
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            switch self {
            case .markdown:
                try container.encode("textParseModeMarkdown", forKey: .type)

            case .hTML:
                try container.encode("textParseModeHTML", forKey: .type)
            }
        }
    }
}
