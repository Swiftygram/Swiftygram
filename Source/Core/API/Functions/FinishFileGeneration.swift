//
//  FinishFileGeneration.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Finishes the file generation

     - ReturnType: `TDObject.Ok`
     */
    struct FinishFileGeneration: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         The identifier of the generation process
         */
        public var generationId: Int64

        /**
         If set, means that file generation has failed and should be terminated
         */
        public var error: TDObject.Error

        /**
         Finishes the file generation

         - Parameter generationId: The identifier of the generation process
         - Parameter error: If set, means that file generation has failed and should be terminated
         */
        public init(generationId: Int64, error: TDObject.Error) {
            self.generationId = generationId
            self.error = error
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            generationId = try container.decodeInt64(forKey: .init(string: "generationId"))
            error = try container.decode(TDObject.Error.self, forKey: .init(string: "error"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(generationId, forKey: .init(string: "generationId"))
            try container.encode(error, forKey: .init(string: "error"))
        }
    }
}
