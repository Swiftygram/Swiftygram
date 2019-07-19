//
//  SaveApplicationLogEvent.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Saves application log event on the server. Can be called before authorization

     - ReturnType: `TDObject.Ok`
     */
    struct SaveApplicationLogEvent: TDFunctionProtocol, AuthorizationIndependentFunction {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Event type
         */
        public var type: String

        /**
         Optional chat identifier, associated with the event
         */
        public var chatId: Int64

        /**
         The log event data
         */
        public var data: TDEnum.JsonValue

        /**
         Saves application log event on the server. Can be called before authorization

         - Parameter type: Event type
         - Parameter chatId: Optional chat identifier, associated with the event
         - Parameter data: The log event data
         */
        public init(type: String, chatId: Int64, data: TDEnum.JsonValue) {
            self.type = type
            self.chatId = chatId
            self.data = data
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            type = try container.decode(String.self, forKey: .init(string: "type"))
            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            data = try container.decode(TDEnum.JsonValue.self, forKey: .init(string: "data"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encode(type, forKey: .init(string: "type"))
            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encode(data, forKey: .init(string: "data"))
        }
    }
}
