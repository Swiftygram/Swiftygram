//
//  PassportElementErrorSource.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDEnum {
    /**
     Contains the description of an error in a Telegram Passport element
     */
    enum PassportElementErrorSource: TDEnumProtocol {
        /**
         The element contains an error in an unspecified place. The error will be considered resolved when new data is added
         */
        case unspecified

        /**
         One of the data fields contains an error. The error will be considered resolved when the value of the field changes

         - fieldName: Field name
         */
        case dataField(fieldName: String)

        /**
         The front side of the document contains an error. The error will be considered resolved when the file with the front side changes
         */
        case frontSide

        /**
         The reverse side of the document contains an error. The error will be considered resolved when the file with the reverse side changes
         */
        case reverseSide

        /**
         The selfie with the document contains an error. The error will be considered resolved when the file with the selfie changes
         */
        case selfie

        /**
         One of files with the translation of the document contains an error. The error will be considered resolved when the file changes

         - fileIndex: Index of a file with the error
         */
        case translationFile(fileIndex: Int)

        /**
         The translation of the document contains an error. The error will be considered resolved when the list of translation files changes
         */
        case translationFiles

        /**
         The file contains an error. The error will be considered resolved when the file changes

         - fileIndex: Index of a file with the error
         */
        case file(fileIndex: Int)

        /**
         The list of attached files contains an error. The error will be considered resolved when the list of files changes
         */
        case files

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let type = try container.decode(String.self, forKey: .type)

            switch type {
            case "passportElementErrorSourceUnspecified":
                self = .unspecified

            case "passportElementErrorSourceDataField":
                let fieldName = try container.decode(String.self, forKey: .init(string: "fieldName"))

                self = .dataField(fieldName: fieldName)

            case "passportElementErrorSourceFrontSide":
                self = .frontSide

            case "passportElementErrorSourceReverseSide":
                self = .reverseSide

            case "passportElementErrorSourceSelfie":
                self = .selfie

            case "passportElementErrorSourceTranslationFile":
                let fileIndex = try container.decode(Int.self, forKey: .init(string: "fileIndex"))

                self = .translationFile(fileIndex: fileIndex)

            case "passportElementErrorSourceTranslationFiles":
                self = .translationFiles

            case "passportElementErrorSourceFile":
                let fileIndex = try container.decode(Int.self, forKey: .init(string: "fileIndex"))

                self = .file(fileIndex: fileIndex)

            case "passportElementErrorSourceFiles":
                self = .files

            default:
                throw DecodingError.typeMismatch(PassportElementErrorSource.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined PassportElementErrorSource"))
            }
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            switch self {
            case .unspecified:
                try container.encode("passportElementErrorSourceUnspecified", forKey: .type)

            case let .dataField(fieldName):
                try container.encode("passportElementErrorSourceDataField", forKey: .type)

                try container.encode(fieldName, forKey: .init(string: "fieldName"))

            case .frontSide:
                try container.encode("passportElementErrorSourceFrontSide", forKey: .type)

            case .reverseSide:
                try container.encode("passportElementErrorSourceReverseSide", forKey: .type)

            case .selfie:
                try container.encode("passportElementErrorSourceSelfie", forKey: .type)

            case let .translationFile(fileIndex):
                try container.encode("passportElementErrorSourceTranslationFile", forKey: .type)

                try container.encode(fileIndex, forKey: .init(string: "fileIndex"))

            case .translationFiles:
                try container.encode("passportElementErrorSourceTranslationFiles", forKey: .type)

            case let .file(fileIndex):
                try container.encode("passportElementErrorSourceFile", forKey: .type)

                try container.encode(fileIndex, forKey: .init(string: "fileIndex"))

            case .files:
                try container.encode("passportElementErrorSourceFiles", forKey: .type)
            }
        }
    }
}
