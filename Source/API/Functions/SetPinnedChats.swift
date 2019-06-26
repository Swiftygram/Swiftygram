//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Changes the order of pinned chats

     - ReturnType: `TDObject.Ok`
     */
    struct SetPinnedChats: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         The new list of pinned chats
         */
        public var chatIds: [Int64]

        /**
         Changes the order of pinned chats

         - Parameter chatIds: The new list of pinned chats
         */
        public init(chatIds: [Int64]) {
            self.chatIds = chatIds
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatIds = try container.decodeInt64Array(forKey: .init(string: "chatIds"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64Array(chatIds, forKey: .init(string: "chatIds"))
        }
    }
}
