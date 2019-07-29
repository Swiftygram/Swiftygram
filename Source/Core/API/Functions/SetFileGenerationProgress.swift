//
//  SetFileGenerationProgress.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Informs TDLib on a file generation prograss

     - ReturnType: `TDObject.Ok`
     */
    struct SetFileGenerationProgress: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         The identifier of the generation process
         */
        public var generationId: Int64

        /**
         Expected size of the generated file, in bytes; 0 if unknown
         */
        public var expectedSize: Int

        /**
         The number of bytes already generated
         */
        public var localPrefixSize: Int

        /**
         Informs TDLib on a file generation prograss

         - Parameter generationId: The identifier of the generation process
         - Parameter expectedSize: Expected size of the generated file, in bytes; 0 if unknown
         - Parameter localPrefixSize: The number of bytes already generated
         */
        public init(generationId: Int64, expectedSize: Int, localPrefixSize: Int) {
            self.generationId = generationId
            self.expectedSize = expectedSize
            self.localPrefixSize = localPrefixSize
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            generationId = try container.decodeInt64(forKey: .init(string: "generationId"))
            expectedSize = try container.decode(Int.self, forKey: .init(string: "expectedSize"))
            localPrefixSize = try container.decode(Int.self, forKey: .init(string: "localPrefixSize"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(generationId, forKey: .init(string: "generationId"))
            try container.encode(expectedSize, forKey: .init(string: "expectedSize"))
            try container.encode(localPrefixSize, forKey: .init(string: "localPrefixSize"))
        }
    }
}
