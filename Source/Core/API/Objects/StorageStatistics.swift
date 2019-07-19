//
//  StorageStatistics.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains the exact storage usage statistics split by chats and file type
     */
    struct StorageStatistics: TDObjectProtocol {
        /**
         Total size of files
         */
        public var size: Int64

        /**
         Total number of files
         */
        public var count: Int

        /**
         Statistics split by chats
         */
        public var byChat: [TDObject.StorageStatisticsByChat]

        /**
         Contains the exact storage usage statistics split by chats and file type

         - Parameter size: Total size of files
         - Parameter count: Total number of files
         - Parameter byChat: Statistics split by chats
         */
        public init(size: Int64, count: Int, byChat: [TDObject.StorageStatisticsByChat]) {
            self.size = size
            self.count = count
            self.byChat = byChat
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            size = try container.decodeInt64(forKey: .init(string: "size"))
            count = try container.decode(Int.self, forKey: .init(string: "count"))
            byChat = try container.decode([TDObject.StorageStatisticsByChat].self, forKey: .init(string: "byChat"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(size, forKey: .init(string: "size"))
            try container.encode(count, forKey: .init(string: "count"))
            try container.encode(byChat, forKey: .init(string: "byChat"))
        }
    }
}
