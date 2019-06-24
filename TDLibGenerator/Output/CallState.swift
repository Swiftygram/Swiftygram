//
//  CallState.swift
//  Swiftygram
//  Created by ky1vstar on 6/24/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDEnum {
    enum CallState: TDEnumProtocol {
        ///  The call is pending, waiting to be accepted by a user
        ///
        ///  - isCreated: True, if the call has already been created by the server
        ///  - isReceived: True, if the call has already been received by the
        /// other party
        case pending(isCreated: Bool, isReceived: Bool)

        ///  The call has been answered and encryption keys are being exchanged
        case exchangingKeys

        ///  The call is ready to use
        ///
        ///  - protocol: Call protocols supported by the peer
        ///  - connections: Available UDP reflectors
        ///  - config: A JSON-encoded call config
        ///  - encryptionKey: Call encryption key
        ///  - emojis: Encryption key emojis fingerprint
        ///  - allowP2P: True, if peer-to-peer connection is allowed by users
        /// privacy settings
        case ready(protocol: TDObject.CallProtocol, connections: [TDObject.CallConnection], config: String, encryptionKey: String, emojis: [String], allowP2P: Bool)

        ///  The call is hanging up after discardCall has been called
        case hangingUp

        ///  The call has ended successfully
        ///
        ///  - reason: The reason, why the call has ended
        ///  - needRating: True, if the call rating should be sent to the server
        ///  - needDebugInformation: True, if the call debug information should be
        /// sent to the server
        case discarded(reason: TDEnum.CallDiscardReason, needRating: Bool, needDebugInformation: Bool)

        ///  The call has ended with an error
        ///
        ///  - error: Error. An error with the code 4005000 will be returned if an
        /// outgoing call is missed because of an expired timeout
        case error(error: TDObject.Error)

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let type = try container.decode(String.self, forKey: .type)

            switch type {
            case "callStatePending":
                let isCreated = try container.decode(Bool.self, forKey: .init(string: "isCreated"))
                let isReceived = try container.decode(Bool.self, forKey: .init(string: "isReceived"))

                self = .pending(isCreated: isCreated, isReceived: isReceived)

            case "callStateExchangingKeys":
                self = .exchangingKeys

            case "callStateReady":
                let `protocol` = try container.decode(TDObject.CallProtocol.self, forKey: .init(string: "protocol"))
                let connections = try container.decode([TDObject.CallConnection].self, forKey: .init(string: "connections"))
                let config = try container.decode(String.self, forKey: .init(string: "config"))
                let encryptionKey = try container.decode(String.self, forKey: .init(string: "encryptionKey"))
                let emojis = try container.decode([String].self, forKey: .init(string: "emojis"))
                let allowP2P = try container.decode(Bool.self, forKey: .init(string: "allowP2P"))

                self = .ready(protocol: protocol, connections: connections, config: config, encryptionKey: encryptionKey, emojis: emojis, allowP2P: allowP2P)

            case "callStateHangingUp":
                self = .hangingUp

            case "callStateDiscarded":
                let reason = try container.decode(TDEnum.CallDiscardReason.self, forKey: .init(string: "reason"))
                let needRating = try container.decode(Bool.self, forKey: .init(string: "needRating"))
                let needDebugInformation = try container.decode(Bool.self, forKey: .init(string: "needDebugInformation"))

                self = .discarded(reason: reason, needRating: needRating, needDebugInformation: needDebugInformation)

            case "callStateError":
                let error = try container.decode(TDObject.Error.self, forKey: .init(string: "error"))

                self = .error(error: error)

            default:
                throw DecodingError.typeMismatch(CallState.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined CallState"))
            }
        }

        // MARK: - Decodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            switch self {
            case let .pending(isCreated, isReceived):
                try container.encode("callStatePending", forKey: .type)

                try container.encode(isCreated, forKey: .init(string: "isCreated"))
                try container.encode(isReceived, forKey: .init(string: "isReceived"))

            case .exchangingKeys:
                try container.encode("callStateExchangingKeys", forKey: .type)

            case let .ready(protocol, connections, config, encryptionKey, emojis, allowP2P):
                try container.encode("callStateReady", forKey: .type)

                try container.encode(protocol, forKey: .init(string: "protocol"))
                try container.encode(connections, forKey: .init(string: "connections"))
                try container.encode(config, forKey: .init(string: "config"))
                try container.encode(encryptionKey, forKey: .init(string: "encryptionKey"))
                try container.encode(emojis, forKey: .init(string: "emojis"))
                try container.encode(allowP2P, forKey: .init(string: "allowP2P"))

            case .hangingUp:
                try container.encode("callStateHangingUp", forKey: .type)

            case let .discarded(reason, needRating, needDebugInformation):
                try container.encode("callStateDiscarded", forKey: .type)

                try container.encode(reason, forKey: .init(string: "reason"))
                try container.encode(needRating, forKey: .init(string: "needRating"))
                try container.encode(needDebugInformation, forKey: .init(string: "needDebugInformation"))

            case let .error(error):
                try container.encode("callStateError", forKey: .type)

                try container.encode(error, forKey: .init(string: "error"))
            }
        }
    }
}
