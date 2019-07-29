//
//  SetChatClientData.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Changes client data associated with a chat

     - ReturnType: `TDObject.Ok`
     */
    struct SetChatClientData: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Chat identifier
         */
        public var chatId: Int64

        /**
         New value of client_data
         */
        public var clientData: String

        /**
         Changes client data associated with a chat

         - Parameter chatId: Chat identifier
         - Parameter clientData: New value of client_data
         */
        public init(chatId: Int64, clientData: String) {
            self.chatId = chatId
            self.clientData = clientData
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            clientData = try container.decode(String.self, forKey: .init(string: "clientData"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encode(clientData, forKey: .init(string: "clientData"))
        }
    }
}
