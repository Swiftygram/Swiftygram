//
//  TextEntityType.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDEnum {
    /**
     Represents a part of the text which must be formatted differently
     */
    enum TextEntityType: TDEnumProtocol {
        /**
         A mention of a user by their username
         */
        case mention

        /**
         A hashtag text, beginning with "#"
         */
        case hashtag

        /**
         A cashtag text, beginning with "$" and consisting of capital english letters (i.e. "$USD")
         */
        case cashtag

        /**
         A bot command, beginning with "/". This shouldn't be highlighted if there are no bots in the chat
         */
        case botCommand

        /**
         An HTTP URL
         */
        case url

        /**
         An email address
         */
        case emailAddress

        /**
         A bold text
         */
        case bold

        /**
         An italic text
         */
        case italic

        /**
         Text that must be formatted as if inside a code HTML tag
         */
        case code

        /**
         Text that must be formatted as if inside a pre HTML tag
         */
        case pre

        /**
         Text that must be formatted as if inside pre, and code HTML tags

         - language: Programming language of the code; as defined by the sender
         */
        case preCode(language: String)

        /**
         A text description shown instead of a raw URL

         - url: HTTP or tg:// URL to be opened when the link is clicked
         */
        case textUrl(url: URL)

        /**
         A text shows instead of a raw mention of the user (e.g., when the user has no username)

         - userId: Identifier of the mentioned user
         */
        case mentionName(userId: Int)

        /**
         A phone number
         */
        case phoneNumber

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let type = try container.decode(String.self, forKey: .type)

            switch type {
            case "textEntityTypeMention":
                self = .mention

            case "textEntityTypeHashtag":
                self = .hashtag

            case "textEntityTypeCashtag":
                self = .cashtag

            case "textEntityTypeBotCommand":
                self = .botCommand

            case "textEntityTypeUrl":
                self = .url

            case "textEntityTypeEmailAddress":
                self = .emailAddress

            case "textEntityTypeBold":
                self = .bold

            case "textEntityTypeItalic":
                self = .italic

            case "textEntityTypeCode":
                self = .code

            case "textEntityTypePre":
                self = .pre

            case "textEntityTypePreCode":
                let language = try container.decode(String.self, forKey: .init(string: "language"))

                self = .preCode(language: language)

            case "textEntityTypeTextUrl":
                let url = try container.decode(URL.self, forKey: .init(string: "url"))

                self = .textUrl(url: url)

            case "textEntityTypeMentionName":
                let userId = try container.decode(Int.self, forKey: .init(string: "userId"))

                self = .mentionName(userId: userId)

            case "textEntityTypePhoneNumber":
                self = .phoneNumber

            default:
                throw DecodingError.typeMismatch(TextEntityType.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined TextEntityType"))
            }
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            switch self {
            case .mention:
                try container.encode("textEntityTypeMention", forKey: .type)

            case .hashtag:
                try container.encode("textEntityTypeHashtag", forKey: .type)

            case .cashtag:
                try container.encode("textEntityTypeCashtag", forKey: .type)

            case .botCommand:
                try container.encode("textEntityTypeBotCommand", forKey: .type)

            case .url:
                try container.encode("textEntityTypeUrl", forKey: .type)

            case .emailAddress:
                try container.encode("textEntityTypeEmailAddress", forKey: .type)

            case .bold:
                try container.encode("textEntityTypeBold", forKey: .type)

            case .italic:
                try container.encode("textEntityTypeItalic", forKey: .type)

            case .code:
                try container.encode("textEntityTypeCode", forKey: .type)

            case .pre:
                try container.encode("textEntityTypePre", forKey: .type)

            case let .preCode(language):
                try container.encode("textEntityTypePreCode", forKey: .type)

                try container.encode(language, forKey: .init(string: "language"))

            case let .textUrl(url):
                try container.encode("textEntityTypeTextUrl", forKey: .type)

                try container.encode(url, forKey: .init(string: "url"))

            case let .mentionName(userId):
                try container.encode("textEntityTypeMentionName", forKey: .type)

                try container.encode(userId, forKey: .init(string: "userId"))

            case .phoneNumber:
                try container.encode("textEntityTypePhoneNumber", forKey: .type)
            }
        }

        public var isMention: Bool {
            if case .mention = self {
                return true
            } else {
                return false
            }
        }

        public var isHashtag: Bool {
            if case .hashtag = self {
                return true
            } else {
                return false
            }
        }

        public var isCashtag: Bool {
            if case .cashtag = self {
                return true
            } else {
                return false
            }
        }

        public var isBotCommand: Bool {
            if case .botCommand = self {
                return true
            } else {
                return false
            }
        }

        public var isUrl: Bool {
            if case .url = self {
                return true
            } else {
                return false
            }
        }

        public var isEmailAddress: Bool {
            if case .emailAddress = self {
                return true
            } else {
                return false
            }
        }

        public var isBold: Bool {
            if case .bold = self {
                return true
            } else {
                return false
            }
        }

        public var isItalic: Bool {
            if case .italic = self {
                return true
            } else {
                return false
            }
        }

        public var isCode: Bool {
            if case .code = self {
                return true
            } else {
                return false
            }
        }

        public var isPre: Bool {
            if case .pre = self {
                return true
            } else {
                return false
            }
        }

        public var isPreCode: Bool {
            if case .preCode = self {
                return true
            } else {
                return false
            }
        }

        public var isTextUrl: Bool {
            if case .textUrl = self {
                return true
            } else {
                return false
            }
        }

        public var isMentionName: Bool {
            if case .mentionName = self {
                return true
            } else {
                return false
            }
        }

        public var isPhoneNumber: Bool {
            if case .phoneNumber = self {
                return true
            } else {
                return false
            }
        }
    }
}
