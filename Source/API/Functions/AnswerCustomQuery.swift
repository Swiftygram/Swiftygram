//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Answers a custom query; for bots only

     - ReturnType: `TDObject.Ok`
     */
    struct AnswerCustomQuery: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Identifier of a custom query
         */
        public var customQueryId: Int64

        /**
         JSON-serialized answer to the query
         */
        public var data: String

        /**
         Answers a custom query; for bots only

         - Parameter customQueryId: Identifier of a custom query
         - Parameter data: JSON-serialized answer to the query
         */
        public init(customQueryId: Int64, data: String) {
            self.customQueryId = customQueryId
            self.data = data
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            customQueryId = try container.decodeInt64(forKey: .init(string: "customQueryId"))
            data = try container.decode(String.self, forKey: .init(string: "data"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(customQueryId, forKey: .init(string: "customQueryId"))
            try container.encode(data, forKey: .init(string: "data"))
        }
    }
}
