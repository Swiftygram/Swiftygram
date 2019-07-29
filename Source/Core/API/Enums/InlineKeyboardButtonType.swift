//
//  InlineKeyboardButtonType.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDEnum {
    /**
     Describes the type of an inline keyboard button
     */
    enum InlineKeyboardButtonType: TDEnumProtocol {
        /**
         A button that opens a specified URL

         - url: HTTP or tg:// URL to open
         */
        case url(url: URL)

        /**
         A button that sends a special callback query to a bot

         - data: Data to be sent to the bot via a callback query
         */
        case callback(data: String)

        /**
         A button with a game that sends a special callback query to a bot. This button must be in the first column and row of the keyboard and can be attached only to a message with content of the type messageGame
         */
        case callbackGame

        /**
         A button that forces an inline query to the bot to be inserted in the input field

         - query: Inline query to be sent to the bot
         - inCurrentChat: True, if the inline query should be sent from the current chat
         */
        case switchInline(query: String, inCurrentChat: Bool)

        /**
         A button to buy something. This button must be in the first column and row of the keyboard and can be attached only to a message with content of the type messageInvoice
         */
        case buy

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let type = try container.decode(String.self, forKey: .type)

            switch type {
            case "inlineKeyboardButtonTypeUrl":
                let url = try container.decode(URL.self, forKey: .init(string: "url"))

                self = .url(url: url)

            case "inlineKeyboardButtonTypeCallback":
                let data = try container.decode(String.self, forKey: .init(string: "data"))

                self = .callback(data: data)

            case "inlineKeyboardButtonTypeCallbackGame":
                self = .callbackGame

            case "inlineKeyboardButtonTypeSwitchInline":
                let query = try container.decode(String.self, forKey: .init(string: "query"))
                let inCurrentChat = try container.decode(Bool.self, forKey: .init(string: "inCurrentChat"))

                self = .switchInline(query: query, inCurrentChat: inCurrentChat)

            case "inlineKeyboardButtonTypeBuy":
                self = .buy

            default:
                throw DecodingError.typeMismatch(InlineKeyboardButtonType.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined InlineKeyboardButtonType"))
            }
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            switch self {
            case let .url(url):
                try container.encode("inlineKeyboardButtonTypeUrl", forKey: .type)

                try container.encode(url, forKey: .init(string: "url"))

            case let .callback(data):
                try container.encode("inlineKeyboardButtonTypeCallback", forKey: .type)

                try container.encode(data, forKey: .init(string: "data"))

            case .callbackGame:
                try container.encode("inlineKeyboardButtonTypeCallbackGame", forKey: .type)

            case let .switchInline(query, inCurrentChat):
                try container.encode("inlineKeyboardButtonTypeSwitchInline", forKey: .type)

                try container.encode(query, forKey: .init(string: "query"))
                try container.encode(inCurrentChat, forKey: .init(string: "inCurrentChat"))

            case .buy:
                try container.encode("inlineKeyboardButtonTypeBuy", forKey: .type)
            }
        }

        public var isUrl: Bool {
            if case .url = self {
                return true
            } else {
                return false
            }
        }

        public var isCallback: Bool {
            if case .callback = self {
                return true
            } else {
                return false
            }
        }

        public var isCallbackGame: Bool {
            if case .callbackGame = self {
                return true
            } else {
                return false
            }
        }

        public var isSwitchInline: Bool {
            if case .switchInline = self {
                return true
            } else {
                return false
            }
        }

        public var isBuy: Bool {
            if case .buy = self {
                return true
            } else {
                return false
            }
        }
    }
}
