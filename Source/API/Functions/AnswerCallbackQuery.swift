//
//  AnswerCallbackQuery.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Sets the result of a callback query; for bots only

     - ReturnType: `TDObject.Ok`
     */
    struct AnswerCallbackQuery: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Identifier of the callback query
         */
        public let callbackQueryId: Int64

        /**
         Text of the answer
         */
        public let text: String

        /**
         If true, an alert should be shown to the user instead of a toast notification
         */
        public let showAlert: Bool

        /**
         URL to be opened
         */
        public let url: URL

        /**
         Time during which the result of the query can be cached, in seconds
         */
        public let cacheTime: Int

        /**
         Sets the result of a callback query; for bots only

         - Parameter callbackQueryId: Identifier of the callback query
         - Parameter text: Text of the answer
         - Parameter showAlert: If true, an alert should be shown to the user instead of a toast notification
         - Parameter url: URL to be opened
         - Parameter cacheTime: Time during which the result of the query can be cached, in seconds
         */
        public init(callbackQueryId: Int64, text: String, showAlert: Bool, url: URL, cacheTime: Int) {
            self.callbackQueryId = callbackQueryId
            self.text = text
            self.showAlert = showAlert
            self.url = url
            self.cacheTime = cacheTime
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            callbackQueryId = try container.decodeInt64(forKey: .init(string: "callbackQueryId"))
            text = try container.decode(String.self, forKey: .init(string: "text"))
            showAlert = try container.decode(Bool.self, forKey: .init(string: "showAlert"))
            url = try container.decode(URL.self, forKey: .init(string: "url"))
            cacheTime = try container.decode(Int.self, forKey: .init(string: "cacheTime"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(callbackQueryId, forKey: .init(string: "callbackQueryId"))
            try container.encode(text, forKey: .init(string: "text"))
            try container.encode(showAlert, forKey: .init(string: "showAlert"))
            try container.encode(url, forKey: .init(string: "url"))
            try container.encode(cacheTime, forKey: .init(string: "cacheTime"))
        }
    }
}
