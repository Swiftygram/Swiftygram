//
//  StorageStatisticsByChat.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains the storage usage statistics for a specific chat
     */
    struct StorageStatisticsByChat: TDObjectProtocol {
        /**
         Chat identifier; 0 if none
         */
        public var chatId: Int64

        /**
         Total size of the files in the chat
         */
        public var size: Int64

        /**
         Total number of files in the chat
         */
        public var count: Int

        /**
         Statistics split by file types
         */
        public var byFileType: [TDObject.StorageStatisticsByFileType]

        /**
         Contains the storage usage statistics for a specific chat

         - Parameter chatId: Chat identifier; 0 if none
         - Parameter size: Total size of the files in the chat
         - Parameter count: Total number of files in the chat
         - Parameter byFileType: Statistics split by file types
         */
        public init(chatId: Int64, size: Int64, count: Int, byFileType: [TDObject.StorageStatisticsByFileType]) {
            self.chatId = chatId
            self.size = size
            self.count = count
            self.byFileType = byFileType
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            size = try container.decodeInt64(forKey: .init(string: "size"))
            count = try container.decode(Int.self, forKey: .init(string: "count"))
            byFileType = try container.decode([TDObject.StorageStatisticsByFileType].self, forKey: .init(string: "byFileType"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encodeInt64(size, forKey: .init(string: "size"))
            try container.encode(count, forKey: .init(string: "count"))
            try container.encode(byFileType, forKey: .init(string: "byFileType"))
        }
    }
}
