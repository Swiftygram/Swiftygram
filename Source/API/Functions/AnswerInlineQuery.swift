//
//  AnswerInlineQuery.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Sets the result of an inline query; for bots only

     - ReturnType: `TDObject.Ok`
     */
    struct AnswerInlineQuery: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Identifier of the inline query
         */
        public let inlineQueryId: Int64

        /**
         True, if the result of the query can be cached for the specified user
         */
        public let isPersonal: Bool

        /**
         The results of the query
         */
        public let results: [TDEnum.InputInlineQueryResult]

        /**
         Allowed time to cache the results of the query, in seconds
         */
        public let cacheTime: Int

        /**
         Offset for the next inline query; pass an empty string if there are no more results
         */
        public let nextOffset: String

        /**
         If non-empty, this text should be shown on the button that opens a private chat with the bot and sends a start message to the bot with the parameter switch_pm_parameter
         */
        public let switchPmText: String

        /**
         The parameter for the bot start message
         */
        public let switchPmParameter: String

        /**
         Sets the result of an inline query; for bots only

         - Parameter inlineQueryId: Identifier of the inline query
         - Parameter isPersonal: True, if the result of the query can be cached for the specified user
         - Parameter results: The results of the query
         - Parameter cacheTime: Allowed time to cache the results of the query, in seconds
         - Parameter nextOffset: Offset for the next inline query; pass an empty string if there are no more results
         - Parameter switchPmText: If non-empty, this text should be shown on the button that opens a private chat with the bot and sends a start message to the bot with the parameter switch_pm_parameter
         - Parameter switchPmParameter: The parameter for the bot start message
         */
        public init(inlineQueryId: Int64, isPersonal: Bool, results: [TDEnum.InputInlineQueryResult], cacheTime: Int, nextOffset: String, switchPmText: String, switchPmParameter: String) {
            self.inlineQueryId = inlineQueryId
            self.isPersonal = isPersonal
            self.results = results
            self.cacheTime = cacheTime
            self.nextOffset = nextOffset
            self.switchPmText = switchPmText
            self.switchPmParameter = switchPmParameter
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            inlineQueryId = try container.decodeInt64(forKey: .init(string: "inlineQueryId"))
            isPersonal = try container.decode(Bool.self, forKey: .init(string: "isPersonal"))
            results = try container.decode([TDEnum.InputInlineQueryResult].self, forKey: .init(string: "results"))
            cacheTime = try container.decode(Int.self, forKey: .init(string: "cacheTime"))
            nextOffset = try container.decode(String.self, forKey: .init(string: "nextOffset"))
            switchPmText = try container.decode(String.self, forKey: .init(string: "switchPmText"))
            switchPmParameter = try container.decode(String.self, forKey: .init(string: "switchPmParameter"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(inlineQueryId, forKey: .init(string: "inlineQueryId"))
            try container.encode(isPersonal, forKey: .init(string: "isPersonal"))
            try container.encode(results, forKey: .init(string: "results"))
            try container.encode(cacheTime, forKey: .init(string: "cacheTime"))
            try container.encode(nextOffset, forKey: .init(string: "nextOffset"))
            try container.encode(switchPmText, forKey: .init(string: "switchPmText"))
            try container.encode(switchPmParameter, forKey: .init(string: "switchPmParameter"))
        }
    }
}
