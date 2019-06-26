//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDEnum {
    /**
     Represents the relationship between user A and user B. For incoming_link, user A is the current user; for outgoing_link, user B is the current user
     */
    enum LinkState: TDEnumProtocol {
        /**
         The phone number of user A is not known to user B
         */
        case none

        /**
         The phone number of user A is known but that number has not been saved to the contact list of user B
         */
        case knowsPhoneNumber

        /**
         The phone number of user A has been saved to the contact list of user B
         */
        case isContact

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let type = try container.decode(String.self, forKey: .type)

            switch type {
            case "linkStateNone":
                self = .none

            case "linkStateKnowsPhoneNumber":
                self = .knowsPhoneNumber

            case "linkStateIsContact":
                self = .isContact

            default:
                throw DecodingError.typeMismatch(LinkState.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined LinkState"))
            }
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            switch self {
            case .none:
                try container.encode("linkStateNone", forKey: .type)

            case .knowsPhoneNumber:
                try container.encode("linkStateKnowsPhoneNumber", forKey: .type)

            case .isContact:
                try container.encode("linkStateIsContact", forKey: .type)
            }
        }
    }
}
