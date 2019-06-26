//
//  WriteGeneratedFilePart.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Writes a part of a generated file. This method is intended to be used only if the client has no direct access to TDLib's file system, because it is usually slower than a direct write to the destination file

     - ReturnType: `TDObject.Ok`
     */
    struct WriteGeneratedFilePart: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         The identifier of the generation process
         */
        public let generationId: Int64

        /**
         The offset from which to write the data to the file
         */
        public let offset: Int

        /**
         The data to write
         */
        public let data: String

        /**
         Writes a part of a generated file. This method is intended to be used only if the client has no direct access to TDLib's file system, because it is usually slower than a direct write to the destination file

         - Parameter generationId: The identifier of the generation process
         - Parameter offset: The offset from which to write the data to the file
         - Parameter data: The data to write
         */
        public init(generationId: Int64, offset: Int, data: String) {
            self.generationId = generationId
            self.offset = offset
            self.data = data
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            generationId = try container.decodeInt64(forKey: .init(string: "generationId"))
            offset = try container.decode(Int.self, forKey: .init(string: "offset"))
            data = try container.decode(String.self, forKey: .init(string: "data"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(generationId, forKey: .init(string: "generationId"))
            try container.encode(offset, forKey: .init(string: "offset"))
            try container.encode(data, forKey: .init(string: "data"))
        }
    }
}
