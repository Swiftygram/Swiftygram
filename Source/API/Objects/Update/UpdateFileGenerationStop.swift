//
//  UpdateFileGenerationStop.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     File generation is no longer needed
     */
    struct UpdateFileGenerationStop: TDObject.Update {
        /**
         Unique identifier for the generation process
         */
        public let generationId: Int64

        /**
         File generation is no longer needed

         - Parameter generationId: Unique identifier for the generation process
         */
        public init(generationId: Int64) {
            self.generationId = generationId
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            generationId = try container.decodeInt64(forKey: .init(string: "generationId"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(generationId, forKey: .init(string: "generationId"))
        }
    }
}
