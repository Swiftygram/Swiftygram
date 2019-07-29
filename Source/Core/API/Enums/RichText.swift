//
//  RichText.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDEnum {
    /**
     Describes a text object inside an instant-view web page
     */
    indirect enum RichText: TDEnumProtocol {
        /**
         A plain text

         - text: Text
         */
        case plain(text: String)

        /**
         A bold rich text

         - text: Text
         */
        case bold(text: TDEnum.RichText)

        /**
         An italicized rich text

         - text: Text
         */
        case italic(text: TDEnum.RichText)

        /**
         An underlined rich text

         - text: Text
         */
        case underline(text: TDEnum.RichText)

        /**
         A strike-through rich text

         - text: Text
         */
        case strikethrough(text: TDEnum.RichText)

        /**
         A fixed-width rich text

         - text: Text
         */
        case fixed(text: TDEnum.RichText)

        /**
         A rich text URL link

         - text: Text
         - url: URL
         */
        case url(text: TDEnum.RichText, url: URL)

        /**
         A rich text email link

         - text: Text
         - emailAddress: Email address
         */
        case emailAddress(text: TDEnum.RichText, emailAddress: String)

        /**
         A subscript rich text

         - text: Text
         */
        case `subscript`(text: TDEnum.RichText)

        /**
         A superscript rich text

         - text: Text
         */
        case superscript(text: TDEnum.RichText)

        /**
         A marked rich text

         - text: Text
         */
        case marked(text: TDEnum.RichText)

        /**
         A rich text phone number

         - text: Text
         - phoneNumber: Phone number
         */
        case phoneNumber(text: TDEnum.RichText, phoneNumber: String)

        /**
         A small image inside the text

         - document: The image represented as a document. The image can be in GIF, JPEG or PNG format
         - width: Width of a bounding box in which the image should be shown, 0 if unknown
         - height: Height of a bounding box in which the image should be shown, 0 if unknown
         */
        case icon(document: TDObject.Document, width: Int, height: Int)

        /**
         A rich text anchor

         - text: Text
         - name: Anchor name
         */
        case anchor(text: TDEnum.RichText, name: String)

        /**
         A concatenation of rich texts

         - texts: Texts
         */
        case s(texts: [TDEnum.RichText])

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let type = try container.decode(String.self, forKey: .type)

            switch type {
            case "richTextPlain":
                let text = try container.decode(String.self, forKey: .init(string: "text"))

                self = .plain(text: text)

            case "richTextBold":
                let text = try container.decode(TDEnum.RichText.self, forKey: .init(string: "text"))

                self = .bold(text: text)

            case "richTextItalic":
                let text = try container.decode(TDEnum.RichText.self, forKey: .init(string: "text"))

                self = .italic(text: text)

            case "richTextUnderline":
                let text = try container.decode(TDEnum.RichText.self, forKey: .init(string: "text"))

                self = .underline(text: text)

            case "richTextStrikethrough":
                let text = try container.decode(TDEnum.RichText.self, forKey: .init(string: "text"))

                self = .strikethrough(text: text)

            case "richTextFixed":
                let text = try container.decode(TDEnum.RichText.self, forKey: .init(string: "text"))

                self = .fixed(text: text)

            case "richTextUrl":
                let text = try container.decode(TDEnum.RichText.self, forKey: .init(string: "text"))
                let url = try container.decode(URL.self, forKey: .init(string: "url"))

                self = .url(text: text, url: url)

            case "richTextEmailAddress":
                let text = try container.decode(TDEnum.RichText.self, forKey: .init(string: "text"))
                let emailAddress = try container.decode(String.self, forKey: .init(string: "emailAddress"))

                self = .emailAddress(text: text, emailAddress: emailAddress)

            case "richTextSubscript":
                let text = try container.decode(TDEnum.RichText.self, forKey: .init(string: "text"))

                self = .subscript(text: text)

            case "richTextSuperscript":
                let text = try container.decode(TDEnum.RichText.self, forKey: .init(string: "text"))

                self = .superscript(text: text)

            case "richTextMarked":
                let text = try container.decode(TDEnum.RichText.self, forKey: .init(string: "text"))

                self = .marked(text: text)

            case "richTextPhoneNumber":
                let text = try container.decode(TDEnum.RichText.self, forKey: .init(string: "text"))
                let phoneNumber = try container.decode(String.self, forKey: .init(string: "phoneNumber"))

                self = .phoneNumber(text: text, phoneNumber: phoneNumber)

            case "richTextIcon":
                let document = try container.decode(TDObject.Document.self, forKey: .init(string: "document"))
                let width = try container.decode(Int.self, forKey: .init(string: "width"))
                let height = try container.decode(Int.self, forKey: .init(string: "height"))

                self = .icon(document: document, width: width, height: height)

            case "richTextAnchor":
                let text = try container.decode(TDEnum.RichText.self, forKey: .init(string: "text"))
                let name = try container.decode(String.self, forKey: .init(string: "name"))

                self = .anchor(text: text, name: name)

            case "richTexts":
                let texts = try container.decode([TDEnum.RichText].self, forKey: .init(string: "texts"))

                self = .s(texts: texts)

            default:
                throw DecodingError.typeMismatch(RichText.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined RichText"))
            }
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            switch self {
            case let .plain(text):
                try container.encode("richTextPlain", forKey: .type)

                try container.encode(text, forKey: .init(string: "text"))

            case let .bold(text):
                try container.encode("richTextBold", forKey: .type)

                try container.encode(text, forKey: .init(string: "text"))

            case let .italic(text):
                try container.encode("richTextItalic", forKey: .type)

                try container.encode(text, forKey: .init(string: "text"))

            case let .underline(text):
                try container.encode("richTextUnderline", forKey: .type)

                try container.encode(text, forKey: .init(string: "text"))

            case let .strikethrough(text):
                try container.encode("richTextStrikethrough", forKey: .type)

                try container.encode(text, forKey: .init(string: "text"))

            case let .fixed(text):
                try container.encode("richTextFixed", forKey: .type)

                try container.encode(text, forKey: .init(string: "text"))

            case let .url(text, url):
                try container.encode("richTextUrl", forKey: .type)

                try container.encode(text, forKey: .init(string: "text"))
                try container.encode(url, forKey: .init(string: "url"))

            case let .emailAddress(text, emailAddress):
                try container.encode("richTextEmailAddress", forKey: .type)

                try container.encode(text, forKey: .init(string: "text"))
                try container.encode(emailAddress, forKey: .init(string: "emailAddress"))

            case let .subscript(text):
                try container.encode("richTextSubscript", forKey: .type)

                try container.encode(text, forKey: .init(string: "text"))

            case let .superscript(text):
                try container.encode("richTextSuperscript", forKey: .type)

                try container.encode(text, forKey: .init(string: "text"))

            case let .marked(text):
                try container.encode("richTextMarked", forKey: .type)

                try container.encode(text, forKey: .init(string: "text"))

            case let .phoneNumber(text, phoneNumber):
                try container.encode("richTextPhoneNumber", forKey: .type)

                try container.encode(text, forKey: .init(string: "text"))
                try container.encode(phoneNumber, forKey: .init(string: "phoneNumber"))

            case let .icon(document, width, height):
                try container.encode("richTextIcon", forKey: .type)

                try container.encode(document, forKey: .init(string: "document"))
                try container.encode(width, forKey: .init(string: "width"))
                try container.encode(height, forKey: .init(string: "height"))

            case let .anchor(text, name):
                try container.encode("richTextAnchor", forKey: .type)

                try container.encode(text, forKey: .init(string: "text"))
                try container.encode(name, forKey: .init(string: "name"))

            case let .s(texts):
                try container.encode("richTexts", forKey: .type)

                try container.encode(texts, forKey: .init(string: "texts"))
            }
        }

        public var isPlain: Bool {
            if case .plain = self {
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

        public var isUnderline: Bool {
            if case .underline = self {
                return true
            } else {
                return false
            }
        }

        public var isStrikethrough: Bool {
            if case .strikethrough = self {
                return true
            } else {
                return false
            }
        }

        public var isFixed: Bool {
            if case .fixed = self {
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

        public var isSubscript: Bool {
            if case .subscript = self {
                return true
            } else {
                return false
            }
        }

        public var isSuperscript: Bool {
            if case .superscript = self {
                return true
            } else {
                return false
            }
        }

        public var isMarked: Bool {
            if case .marked = self {
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

        public var isIcon: Bool {
            if case .icon = self {
                return true
            } else {
                return false
            }
        }

        public var isAnchor: Bool {
            if case .anchor = self {
                return true
            } else {
                return false
            }
        }

        public var isS: Bool {
            if case .s = self {
                return true
            } else {
                return false
            }
        }
    }
}
