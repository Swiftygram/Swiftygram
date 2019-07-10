//
//  InlineQueryResults.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Represents the results of the inline query. Use sendInlineQueryResultMessage to send the result of the query
     */
    struct InlineQueryResults: TDObjectProtocol {
        /**
         Unique identifier of the inline query
         */
        public var inlineQueryId: Int64

        /**
         The offset for the next request. If empty, there are no more results
         */
        public var nextOffset: String

        /**
         Results of the query
         */
        public var results: [TDEnum.InlineQueryResult]

        /**
         If non-empty, this text should be shown on the button, which opens a private chat with the bot and sends the bot a start message with the switch_pm_parameter
         */
        public var switchPmText: String

        /**
         Parameter for the bot start message
         */
        public var switchPmParameter: String

        /**
         Represents the results of the inline query. Use sendInlineQueryResultMessage to send the result of the query

         - Parameter inlineQueryId: Unique identifier of the inline query
         - Parameter nextOffset: The offset for the next request. If empty, there are no more results
         - Parameter results: Results of the query
         - Parameter switchPmText: If non-empty, this text should be shown on the button, which opens a private chat with the bot and sends the bot a start message with the switch_pm_parameter
         - Parameter switchPmParameter: Parameter for the bot start message
         */
        public init(inlineQueryId: Int64, nextOffset: String, results: [TDEnum.InlineQueryResult], switchPmText: String, switchPmParameter: String) {
            self.inlineQueryId = inlineQueryId
            self.nextOffset = nextOffset
            self.results = results
            self.switchPmText = switchPmText
            self.switchPmParameter = switchPmParameter
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            inlineQueryId = try container.decodeInt64(forKey: .init(string: "inlineQueryId"))
            nextOffset = try container.decode(String.self, forKey: .init(string: "nextOffset"))
            results = try container.decode([TDEnum.InlineQueryResult].self, forKey: .init(string: "results"))
            switchPmText = try container.decode(String.self, forKey: .init(string: "switchPmText"))
            switchPmParameter = try container.decode(String.self, forKey: .init(string: "switchPmParameter"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(inlineQueryId, forKey: .init(string: "inlineQueryId"))
            try container.encode(nextOffset, forKey: .init(string: "nextOffset"))
            try container.encode(results, forKey: .init(string: "results"))
            try container.encode(switchPmText, forKey: .init(string: "switchPmText"))
            try container.encode(switchPmParameter, forKey: .init(string: "switchPmParameter"))
        }
    }
}
