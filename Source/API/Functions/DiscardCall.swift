//
//  DiscardCall.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Discards a call

     - ReturnType: `TDObject.Ok`
     */
    struct DiscardCall: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Call identifier
         */
        public var callId: Int

        /**
         True, if the user was disconnected
         */
        public var isDisconnected: Bool

        /**
         The call duration, in seconds
         */
        public var duration: Int

        /**
         Identifier of the connection used during the call
         */
        public var connectionId: Int64

        /**
         Discards a call

         - Parameter callId: Call identifier
         - Parameter isDisconnected: True, if the user was disconnected
         - Parameter duration: The call duration, in seconds
         - Parameter connectionId: Identifier of the connection used during the call
         */
        public init(callId: Int, isDisconnected: Bool, duration: Int, connectionId: Int64) {
            self.callId = callId
            self.isDisconnected = isDisconnected
            self.duration = duration
            self.connectionId = connectionId
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            callId = try container.decode(Int.self, forKey: .init(string: "callId"))
            isDisconnected = try container.decode(Bool.self, forKey: .init(string: "isDisconnected"))
            duration = try container.decode(Int.self, forKey: .init(string: "duration"))
            connectionId = try container.decodeInt64(forKey: .init(string: "connectionId"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encode(callId, forKey: .init(string: "callId"))
            try container.encode(isDisconnected, forKey: .init(string: "isDisconnected"))
            try container.encode(duration, forKey: .init(string: "duration"))
            try container.encodeInt64(connectionId, forKey: .init(string: "connectionId"))
        }
    }
}
