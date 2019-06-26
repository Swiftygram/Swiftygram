//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Describes a poll
     */
    struct Poll: TDObjectProtocol {
        /**
         Unique poll identifier
         */
        public var id: Int64

        /**
         Poll question, 1-255 characters
         */
        public var question: String

        /**
         List of poll answer options
         */
        public var options: [TDObject.PollOption]

        /**
         Total number of voters, participating in the poll
         */
        public var totalVoterCount: Int

        /**
         True, if the poll is closed
         */
        public var isClosed: Bool

        /**
         Describes a poll

         - Parameter id: Unique poll identifier
         - Parameter question: Poll question, 1-255 characters
         - Parameter options: List of poll answer options
         - Parameter totalVoterCount: Total number of voters, participating in the poll
         - Parameter isClosed: True, if the poll is closed
         */
        public init(id: Int64, question: String, options: [TDObject.PollOption], totalVoterCount: Int, isClosed: Bool) {
            self.id = id
            self.question = question
            self.options = options
            self.totalVoterCount = totalVoterCount
            self.isClosed = isClosed
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            id = try container.decodeInt64(forKey: .init(string: "id"))
            question = try container.decode(String.self, forKey: .init(string: "question"))
            options = try container.decode([TDObject.PollOption].self, forKey: .init(string: "options"))
            totalVoterCount = try container.decode(Int.self, forKey: .init(string: "totalVoterCount"))
            isClosed = try container.decode(Bool.self, forKey: .init(string: "isClosed"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(id, forKey: .init(string: "id"))
            try container.encode(question, forKey: .init(string: "question"))
            try container.encode(options, forKey: .init(string: "options"))
            try container.encode(totalVoterCount, forKey: .init(string: "totalVoterCount"))
            try container.encode(isClosed, forKey: .init(string: "isClosed"))
        }
    }
}
