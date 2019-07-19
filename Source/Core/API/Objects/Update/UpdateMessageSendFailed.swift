//
//  UpdateMessageSendFailed.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     A message failed to send. Be aware that some messages being sent can be irrecoverably deleted, in which case updateDeleteMessages will be received instead of this update
     */
    struct UpdateMessageSendFailed: TDObject.Update {
        /**
         Contains information about the message that failed to send
         */
        public var message: TDObject.Message

        /**
         The previous temporary message identifier
         */
        public var oldMessageId: Int64

        /**
         An error code
         */
        public var errorCode: Int

        /**
         Error message
         */
        public var errorMessage: String

        /**
         A message failed to send. Be aware that some messages being sent can be irrecoverably deleted, in which case updateDeleteMessages will be received instead of this update

         - Parameter message: Contains information about the message that failed to send
         - Parameter oldMessageId: The previous temporary message identifier
         - Parameter errorCode: An error code
         - Parameter errorMessage: Error message
         */
        public init(message: TDObject.Message, oldMessageId: Int64, errorCode: Int, errorMessage: String) {
            self.message = message
            self.oldMessageId = oldMessageId
            self.errorCode = errorCode
            self.errorMessage = errorMessage
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            message = try container.decode(TDObject.Message.self, forKey: .init(string: "message"))
            oldMessageId = try container.decodeInt64(forKey: .init(string: "oldMessageId"))
            errorCode = try container.decode(Int.self, forKey: .init(string: "errorCode"))
            errorMessage = try container.decode(String.self, forKey: .init(string: "errorMessage"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encode(message, forKey: .init(string: "message"))
            try container.encodeInt64(oldMessageId, forKey: .init(string: "oldMessageId"))
            try container.encode(errorCode, forKey: .init(string: "errorCode"))
            try container.encode(errorMessage, forKey: .init(string: "errorMessage"))
        }
    }
}
