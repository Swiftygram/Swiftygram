//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Searches for call messages. Returns the results in reverse chronological order (i. e., in order of decreasing message_id). For optimal performance the number of returned messages is chosen by the library

     - ReturnType: `TDObject.Messages`
     */
    struct SearchCallMessages: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Messages

        /**
         Identifier of the message from which to search; use 0 to get results from the last message
         */
        public var fromMessageId: Int64

        /**
         The maximum number of messages to be returned; up to 100. Fewer messages may be returned than specified by the limit, even if the end of the message history has not been reached
         */
        public var limit: Int

        /**
         If true, returns only messages with missed calls
         */
        public var onlyMissed: Bool

        /**
         Searches for call messages. Returns the results in reverse chronological order (i. e., in order of decreasing message_id). For optimal performance the number of returned messages is chosen by the library

         - Parameter fromMessageId: Identifier of the message from which to search; use 0 to get results from the last message
         - Parameter limit: The maximum number of messages to be returned; up to 100. Fewer messages may be returned than specified by the limit, even if the end of the message history has not been reached
         - Parameter onlyMissed: If true, returns only messages with missed calls
         */
        public init(fromMessageId: Int64, limit: Int, onlyMissed: Bool) {
            self.fromMessageId = fromMessageId
            self.limit = limit
            self.onlyMissed = onlyMissed
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            fromMessageId = try container.decodeInt64(forKey: .init(string: "fromMessageId"))
            limit = try container.decode(Int.self, forKey: .init(string: "limit"))
            onlyMissed = try container.decode(Bool.self, forKey: .init(string: "onlyMissed"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(fromMessageId, forKey: .init(string: "fromMessageId"))
            try container.encode(limit, forKey: .init(string: "limit"))
            try container.encode(onlyMissed, forKey: .init(string: "onlyMissed"))
        }
    }
}
