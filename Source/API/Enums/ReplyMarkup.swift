//
//  ReplyMarkup.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDEnum {
    /**
     Contains a description of a custom keyboard and actions that can be done with it to quickly reply to bots
     */
    enum ReplyMarkup: TDEnumProtocol {
        /**
         Instructs clients to remove the keyboard once this message has been received. This kind of keyboard can't be received in an incoming message; instead, UpdateChatReplyMarkup with message_id == 0 will be sent

         - isPersonal: True, if the keyboard is removed only for the mentioned users or the target user of a reply
         */
        case removeKeyboard(isPersonal: Bool)

        /**
         Instructs clients to force a reply to this message

         - isPersonal: True, if a forced reply must automatically be shown to the current user. For outgoing messages, specify true to show the forced reply only for the mentioned users and for the target user of a reply
         */
        case forceReply(isPersonal: Bool)

        /**
         Contains a custom keyboard layout to quickly reply to bots

         - rows: A list of rows of bot keyboard buttons
         - resizeKeyboard: True, if the client needs to resize the keyboard vertically
         - oneTime: True, if the client needs to hide the keyboard after use
         - isPersonal: True, if the keyboard must automatically be shown to the current user. For outgoing messages, specify true to show the keyboard only for the mentioned users and for the target user of a reply
         */
        case showKeyboard(rows: [[TDObject.KeyboardButton]], resizeKeyboard: Bool, oneTime: Bool, isPersonal: Bool)

        /**
         Contains an inline keyboard layout

         - rows: A list of rows of inline keyboard buttons
         */
        case inlineKeyboard(rows: [[TDObject.InlineKeyboardButton]])

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let type = try container.decode(String.self, forKey: .type)

            switch type {
            case "replyMarkupRemoveKeyboard":
                let isPersonal = try container.decode(Bool.self, forKey: .init(string: "isPersonal"))

                self = .removeKeyboard(isPersonal: isPersonal)

            case "replyMarkupForceReply":
                let isPersonal = try container.decode(Bool.self, forKey: .init(string: "isPersonal"))

                self = .forceReply(isPersonal: isPersonal)

            case "replyMarkupShowKeyboard":
                let rows = try container.decode([[TDObject.KeyboardButton]].self, forKey: .init(string: "rows"))
                let resizeKeyboard = try container.decode(Bool.self, forKey: .init(string: "resizeKeyboard"))
                let oneTime = try container.decode(Bool.self, forKey: .init(string: "oneTime"))
                let isPersonal = try container.decode(Bool.self, forKey: .init(string: "isPersonal"))

                self = .showKeyboard(rows: rows, resizeKeyboard: resizeKeyboard, oneTime: oneTime, isPersonal: isPersonal)

            case "replyMarkupInlineKeyboard":
                let rows = try container.decode([[TDObject.InlineKeyboardButton]].self, forKey: .init(string: "rows"))

                self = .inlineKeyboard(rows: rows)

            default:
                throw DecodingError.typeMismatch(ReplyMarkup.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined ReplyMarkup"))
            }
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            switch self {
            case let .removeKeyboard(isPersonal):
                try container.encode("replyMarkupRemoveKeyboard", forKey: .type)

                try container.encode(isPersonal, forKey: .init(string: "isPersonal"))

            case let .forceReply(isPersonal):
                try container.encode("replyMarkupForceReply", forKey: .type)

                try container.encode(isPersonal, forKey: .init(string: "isPersonal"))

            case let .showKeyboard(rows, resizeKeyboard, oneTime, isPersonal):
                try container.encode("replyMarkupShowKeyboard", forKey: .type)

                try container.encode(rows, forKey: .init(string: "rows"))
                try container.encode(resizeKeyboard, forKey: .init(string: "resizeKeyboard"))
                try container.encode(oneTime, forKey: .init(string: "oneTime"))
                try container.encode(isPersonal, forKey: .init(string: "isPersonal"))

            case let .inlineKeyboard(rows):
                try container.encode("replyMarkupInlineKeyboard", forKey: .type)

                try container.encode(rows, forKey: .init(string: "rows"))
            }
        }
    }
}
