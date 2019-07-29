//
//  PageBlockHorizontalAlignment.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDEnum {
    /**
     Describes a horizontal alignment of a table cell content
     */
    enum PageBlockHorizontalAlignment: TDEnumProtocol {
        /**
         The content should be left-aligned
         */
        case left

        /**
         The content should be center-aligned
         */
        case center

        /**
         The content should be right-aligned
         */
        case right

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let type = try container.decode(String.self, forKey: .type)

            switch type {
            case "pageBlockHorizontalAlignmentLeft":
                self = .left

            case "pageBlockHorizontalAlignmentCenter":
                self = .center

            case "pageBlockHorizontalAlignmentRight":
                self = .right

            default:
                throw DecodingError.typeMismatch(PageBlockHorizontalAlignment.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined PageBlockHorizontalAlignment"))
            }
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            switch self {
            case .left:
                try container.encode("pageBlockHorizontalAlignmentLeft", forKey: .type)

            case .center:
                try container.encode("pageBlockHorizontalAlignmentCenter", forKey: .type)

            case .right:
                try container.encode("pageBlockHorizontalAlignmentRight", forKey: .type)
            }
        }

        public var isLeft: Bool {
            if case .left = self {
                return true
            } else {
                return false
            }
        }

        public var isCenter: Bool {
            if case .center = self {
                return true
            } else {
                return false
            }
        }

        public var isRight: Bool {
            if case .right = self {
                return true
            } else {
                return false
            }
        }
    }
}
