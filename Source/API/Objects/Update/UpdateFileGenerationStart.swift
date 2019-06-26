//
//  UpdateFileGenerationStart.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     The file generation process needs to be started by the client
     */
    struct UpdateFileGenerationStart: TDObject.Update {
        /**
         Unique identifier for the generation process
         */
        public let generationId: Int64

        /**
         The path to a file from which a new file is generated; may be empty
         */
        public let originalPath: String

        /**
         The path to a file that should be created and where the new file should be generated
         */
        public let destinationPath: String

        /**
         String specifying the conversion applied to the original file. If conversion is "#url#" than original_path contains an HTTP/HTTPS URL of a file, which should be downloaded by the client
         */
        public let conversion: String

        /**
         The file generation process needs to be started by the client

         - Parameter generationId: Unique identifier for the generation process
         - Parameter originalPath: The path to a file from which a new file is generated; may be empty
         - Parameter destinationPath: The path to a file that should be created and where the new file should be generated
         - Parameter conversion: String specifying the conversion applied to the original file. If conversion is "#url#" than original_path contains an HTTP/HTTPS URL of a file, which should be downloaded by the client
         */
        public init(generationId: Int64, originalPath: String, destinationPath: String, conversion: String) {
            self.generationId = generationId
            self.originalPath = originalPath
            self.destinationPath = destinationPath
            self.conversion = conversion
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            generationId = try container.decodeInt64(forKey: .init(string: "generationId"))
            originalPath = try container.decode(String.self, forKey: .init(string: "originalPath"))
            destinationPath = try container.decode(String.self, forKey: .init(string: "destinationPath"))
            conversion = try container.decode(String.self, forKey: .init(string: "conversion"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(generationId, forKey: .init(string: "generationId"))
            try container.encode(originalPath, forKey: .init(string: "originalPath"))
            try container.encode(destinationPath, forKey: .init(string: "destinationPath"))
            try container.encode(conversion, forKey: .init(string: "conversion"))
        }
    }
}
