//
//  InputFile.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDEnum {
    /**
     Points to a file
     */
    enum InputFile: TDEnumProtocol {
        /**
         A file defined by its unique ID

         - id: Unique file identifier
         */
        case id(id: Int)

        /**
         A file defined by its remote ID

         - id: Remote file identifier
         */
        case remote(id: String)

        /**
         A file defined by a local path

         - path: Local path to the file
         */
        case local(path: String)

        /**
         A file generated by the client

         - originalPath: Local path to a file from which the file is generated; may be empty if there is no such file
         - conversion: String specifying the conversion applied to the original file; should be persistent across application restarts. Conversions beginning with '#' are reserved for internal TDLib usage
         - expectedSize: Expected size of the generated file; 0 if unknown
         */
        case generated(originalPath: String, conversion: String, expectedSize: Int)

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let type = try container.decode(String.self, forKey: .type)

            switch type {
            case "inputFileId":
                let id = try container.decode(Int.self, forKey: .init(string: "id"))

                self = .id(id: id)

            case "inputFileRemote":
                let id = try container.decode(String.self, forKey: .init(string: "id"))

                self = .remote(id: id)

            case "inputFileLocal":
                let path = try container.decode(String.self, forKey: .init(string: "path"))

                self = .local(path: path)

            case "inputFileGenerated":
                let originalPath = try container.decode(String.self, forKey: .init(string: "originalPath"))
                let conversion = try container.decode(String.self, forKey: .init(string: "conversion"))
                let expectedSize = try container.decode(Int.self, forKey: .init(string: "expectedSize"))

                self = .generated(originalPath: originalPath, conversion: conversion, expectedSize: expectedSize)

            default:
                throw DecodingError.typeMismatch(InputFile.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined InputFile"))
            }
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            switch self {
            case let .id(id):
                try container.encode("inputFileId", forKey: .type)

                try container.encode(id, forKey: .init(string: "id"))

            case let .remote(id):
                try container.encode("inputFileRemote", forKey: .type)

                try container.encode(id, forKey: .init(string: "id"))

            case let .local(path):
                try container.encode("inputFileLocal", forKey: .type)

                try container.encode(path, forKey: .init(string: "path"))

            case let .generated(originalPath, conversion, expectedSize):
                try container.encode("inputFileGenerated", forKey: .type)

                try container.encode(originalPath, forKey: .init(string: "originalPath"))
                try container.encode(conversion, forKey: .init(string: "conversion"))
                try container.encode(expectedSize, forKey: .init(string: "expectedSize"))
            }
        }
    }
}
