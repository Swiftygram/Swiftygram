//
//  UpdateMessageSendSucceeded.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     A message has been successfully sent
     */
    struct UpdateMessageSendSucceeded: TDObject.Update {
        /**
         Information about the sent message. Usually only the message identifier, date, and content are changed, but almost all other fields can also change
         */
        public let message: TDObject.Message

        /**
         The previous temporary message identifier
         */
        public let oldMessageId: Int64

        /**
         A message has been successfully sent

         - Parameter message: Information about the sent message. Usually only the message identifier, date, and content are changed, but almost all other fields can also change
         - Parameter oldMessageId: The previous temporary message identifier
         */
        public init(message: TDObject.Message, oldMessageId: Int64) {
            self.message = message
            self.oldMessageId = oldMessageId
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            message = try container.decode(TDObject.Message.self, forKey: .init(string: "message"))
            oldMessageId = try container.decodeInt64(forKey: .init(string: "oldMessageId"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encode(message, forKey: .init(string: "message"))
            try container.encodeInt64(oldMessageId, forKey: .init(string: "oldMessageId"))
        }
    }
}
