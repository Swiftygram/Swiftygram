//
//  CallbackQueryPayload.swift
//  Swiftygram
//  Created by ky1vstar on 6/24/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDEnum {
    enum CallbackQueryPayload: TDEnumProtocol {
        ///  The payload from a general callback button
        ///
        ///  - data: Data that was attached to the callback button
        case data(data: String)

        ///  The payload from a game callback button
        ///
        ///  - gameShortName: A short name of the game that was attached to the
        /// callback button
        case game(gameShortName: String)

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let type = try container.decode(String.self, forKey: .type)

            switch type {
            case "callbackQueryPayloadData":
                let data = try container.decode(String.self, forKey: .init(string: "data"))

                self = .data(data: data)

            case "callbackQueryPayloadGame":
                let gameShortName = try container.decode(String.self, forKey: .init(string: "gameShortName"))

                self = .game(gameShortName: gameShortName)

            default:
                throw DecodingError.typeMismatch(CallbackQueryPayload.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined CallbackQueryPayload"))
            }
        }

        // MARK: - Decodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            switch self {
            case let .data(data):
                try container.encode("callbackQueryPayloadData", forKey: .type)

                try container.encode(data, forKey: .init(string: "data"))

            case let .game(gameShortName):
                try container.encode("callbackQueryPayloadGame", forKey: .type)

                try container.encode(gameShortName, forKey: .init(string: "gameShortName"))
            }
        }
    }
}
