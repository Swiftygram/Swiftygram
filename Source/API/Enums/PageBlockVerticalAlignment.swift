//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDEnum {
    /**
     Describes a Vertical alignment of a table cell content
     */
    enum PageBlockVerticalAlignment: TDEnumProtocol {
        /**
         The content should be top-aligned
         */
        case top

        /**
         The content should be middle-aligned
         */
        case middle

        /**
         The content should be bottom-aligned
         */
        case bottom

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let type = try container.decode(String.self, forKey: .type)

            switch type {
            case "pageBlockVerticalAlignmentTop":
                self = .top

            case "pageBlockVerticalAlignmentMiddle":
                self = .middle

            case "pageBlockVerticalAlignmentBottom":
                self = .bottom

            default:
                throw DecodingError.typeMismatch(PageBlockVerticalAlignment.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined PageBlockVerticalAlignment"))
            }
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            switch self {
            case .top:
                try container.encode("pageBlockVerticalAlignmentTop", forKey: .type)

            case .middle:
                try container.encode("pageBlockVerticalAlignmentMiddle", forKey: .type)

            case .bottom:
                try container.encode("pageBlockVerticalAlignmentBottom", forKey: .type)
            }
        }
    }
}
