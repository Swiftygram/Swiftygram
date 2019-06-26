//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDEnum {
    /**
     Contains the description of an error in a Telegram Passport element; for bots only
     */
    enum InputPassportElementErrorSource: TDEnumProtocol {
        /**
         The element contains an error in an unspecified place. The error will be considered resolved when new data is added

         - elementHash: Current hash of the entire element
         */
        case unspecified(elementHash: String)

        /**
         A data field contains an error. The error is considered resolved when the field's value changes

         - fieldName: Field name
         - dataHash: Current data hash
         */
        case dataField(fieldName: String, dataHash: String)

        /**
         The front side of the document contains an error. The error is considered resolved when the file with the front side of the document changes

         - fileHash: Current hash of the file containing the front side
         */
        case frontSide(fileHash: String)

        /**
         The reverse side of the document contains an error. The error is considered resolved when the file with the reverse side of the document changes

         - fileHash: Current hash of the file containing the reverse side
         */
        case reverseSide(fileHash: String)

        /**
         The selfie contains an error. The error is considered resolved when the file with the selfie changes

         - fileHash: Current hash of the file containing the selfie
         */
        case selfie(fileHash: String)

        /**
         One of the files containing the translation of the document contains an error. The error is considered resolved when the file with the translation changes

         - fileHash: Current hash of the file containing the translation
         */
        case translationFile(fileHash: String)

        /**
         The translation of the document contains an error. The error is considered resolved when the list of files changes

         - fileHashes: Current hashes of all files with the translation
         */
        case translationFiles(fileHashes: [String])

        /**
         The file contains an error. The error is considered resolved when the file changes

         - fileHash: Current hash of the file which has the error
         */
        case file(fileHash: String)

        /**
         The list of attached files contains an error. The error is considered resolved when the file list changes

         - fileHashes: Current hashes of all attached files
         */
        case files(fileHashes: [String])

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let type = try container.decode(String.self, forKey: .type)

            switch type {
            case "inputPassportElementErrorSourceUnspecified":
                let elementHash = try container.decode(String.self, forKey: .init(string: "elementHash"))

                self = .unspecified(elementHash: elementHash)

            case "inputPassportElementErrorSourceDataField":
                let fieldName = try container.decode(String.self, forKey: .init(string: "fieldName"))
                let dataHash = try container.decode(String.self, forKey: .init(string: "dataHash"))

                self = .dataField(fieldName: fieldName, dataHash: dataHash)

            case "inputPassportElementErrorSourceFrontSide":
                let fileHash = try container.decode(String.self, forKey: .init(string: "fileHash"))

                self = .frontSide(fileHash: fileHash)

            case "inputPassportElementErrorSourceReverseSide":
                let fileHash = try container.decode(String.self, forKey: .init(string: "fileHash"))

                self = .reverseSide(fileHash: fileHash)

            case "inputPassportElementErrorSourceSelfie":
                let fileHash = try container.decode(String.self, forKey: .init(string: "fileHash"))

                self = .selfie(fileHash: fileHash)

            case "inputPassportElementErrorSourceTranslationFile":
                let fileHash = try container.decode(String.self, forKey: .init(string: "fileHash"))

                self = .translationFile(fileHash: fileHash)

            case "inputPassportElementErrorSourceTranslationFiles":
                let fileHashes = try container.decode([String].self, forKey: .init(string: "fileHashes"))

                self = .translationFiles(fileHashes: fileHashes)

            case "inputPassportElementErrorSourceFile":
                let fileHash = try container.decode(String.self, forKey: .init(string: "fileHash"))

                self = .file(fileHash: fileHash)

            case "inputPassportElementErrorSourceFiles":
                let fileHashes = try container.decode([String].self, forKey: .init(string: "fileHashes"))

                self = .files(fileHashes: fileHashes)

            default:
                throw DecodingError.typeMismatch(InputPassportElementErrorSource.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined InputPassportElementErrorSource"))
            }
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            switch self {
            case let .unspecified(elementHash):
                try container.encode("inputPassportElementErrorSourceUnspecified", forKey: .type)

                try container.encode(elementHash, forKey: .init(string: "elementHash"))

            case let .dataField(fieldName, dataHash):
                try container.encode("inputPassportElementErrorSourceDataField", forKey: .type)

                try container.encode(fieldName, forKey: .init(string: "fieldName"))
                try container.encode(dataHash, forKey: .init(string: "dataHash"))

            case let .frontSide(fileHash):
                try container.encode("inputPassportElementErrorSourceFrontSide", forKey: .type)

                try container.encode(fileHash, forKey: .init(string: "fileHash"))

            case let .reverseSide(fileHash):
                try container.encode("inputPassportElementErrorSourceReverseSide", forKey: .type)

                try container.encode(fileHash, forKey: .init(string: "fileHash"))

            case let .selfie(fileHash):
                try container.encode("inputPassportElementErrorSourceSelfie", forKey: .type)

                try container.encode(fileHash, forKey: .init(string: "fileHash"))

            case let .translationFile(fileHash):
                try container.encode("inputPassportElementErrorSourceTranslationFile", forKey: .type)

                try container.encode(fileHash, forKey: .init(string: "fileHash"))

            case let .translationFiles(fileHashes):
                try container.encode("inputPassportElementErrorSourceTranslationFiles", forKey: .type)

                try container.encode(fileHashes, forKey: .init(string: "fileHashes"))

            case let .file(fileHash):
                try container.encode("inputPassportElementErrorSourceFile", forKey: .type)

                try container.encode(fileHash, forKey: .init(string: "fileHash"))

            case let .files(fileHashes):
                try container.encode("inputPassportElementErrorSourceFiles", forKey: .type)

                try container.encode(fileHashes, forKey: .init(string: "fileHashes"))
            }
        }
    }
}
