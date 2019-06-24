//
//  MaskPoint.swift
//  Swiftygram
//  Created by ky1vstar on 6/24/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDEnum {
    enum MaskPoint: TDEnumProtocol {
        ///  A mask should be placed relatively to the forehead
        case forehead

        ///  A mask should be placed relatively to the eyes
        case eyes

        ///  A mask should be placed relatively to the mouth
        case mouth

        ///  A mask should be placed relatively to the chin
        case chin

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let type = try container.decode(String.self, forKey: .type)

            switch type {
            case "maskPointForehead":
                self = .forehead

            case "maskPointEyes":
                self = .eyes

            case "maskPointMouth":
                self = .mouth

            case "maskPointChin":
                self = .chin

            default:
                throw DecodingError.typeMismatch(MaskPoint.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined MaskPoint"))
            }
        }

        // MARK: - Decodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            switch self {
            case .forehead:
                try container.encode("maskPointForehead", forKey: .type)

            case .eyes:
                try container.encode("maskPointEyes", forKey: .type)

            case .mouth:
                try container.encode("maskPointMouth", forKey: .type)

            case .chin:
                try container.encode("maskPointChin", forKey: .type)
            }
        }
    }
}
