//
//  TerminateSession.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Terminates a session of the current user

     - ReturnType: `TDObject.Ok`
     */
    struct TerminateSession: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Session identifier
         */
        public let sessionId: Int64

        /**
         Terminates a session of the current user

         - Parameter sessionId: Session identifier
         */
        public init(sessionId: Int64) {
            self.sessionId = sessionId
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            sessionId = try container.decodeInt64(forKey: .init(string: "sessionId"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(sessionId, forKey: .init(string: "sessionId"))
        }
    }
}
