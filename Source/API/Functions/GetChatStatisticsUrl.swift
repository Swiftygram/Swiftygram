//
//  GetChatStatisticsUrl.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns URL with the chat statistics. Currently this method can be used only for channels

     - ReturnType: `TDObject.HttpUrl`
     */
    struct GetChatStatisticsUrl: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.HttpUrl

        /**
         Chat identifier
         */
        public var chatId: Int64

        /**
         Parameters from "tg://statsrefresh?params=******" link
         */
        public var parameters: String

        /**
         Pass true if a URL with the dark theme must be returned
         */
        public var isDark: Bool

        /**
         Returns URL with the chat statistics. Currently this method can be used only for channels

         - Parameter chatId: Chat identifier
         - Parameter parameters: Parameters from "tg://statsrefresh?params=******" link
         - Parameter isDark: Pass true if a URL with the dark theme must be returned
         */
        public init(chatId: Int64, parameters: String, isDark: Bool) {
            self.chatId = chatId
            self.parameters = parameters
            self.isDark = isDark
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            parameters = try container.decode(String.self, forKey: .init(string: "parameters"))
            isDark = try container.decode(Bool.self, forKey: .init(string: "isDark"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encode(parameters, forKey: .init(string: "parameters"))
            try container.encode(isDark, forKey: .init(string: "isDark"))
        }
    }
}
