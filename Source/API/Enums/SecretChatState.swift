//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDEnum {
    /**
     Describes the current secret chat state
     */
    enum SecretChatState: TDEnumProtocol {
        /**
         The secret chat is not yet created; waiting for the other user to get online
         */
        case pending

        /**
         The secret chat is ready to use
         */
        case ready

        /**
         The secret chat is closed
         */
        case closed

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let type = try container.decode(String.self, forKey: .type)

            switch type {
            case "secretChatStatePending":
                self = .pending

            case "secretChatStateReady":
                self = .ready

            case "secretChatStateClosed":
                self = .closed

            default:
                throw DecodingError.typeMismatch(SecretChatState.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined SecretChatState"))
            }
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            switch self {
            case .pending:
                try container.encode("secretChatStatePending", forKey: .type)

            case .ready:
                try container.encode("secretChatStateReady", forKey: .type)

            case .closed:
                try container.encode("secretChatStateClosed", forKey: .type)
            }
        }
    }
}
