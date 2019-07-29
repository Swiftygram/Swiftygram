//
//  OptimizeStorage.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Optimizes storage usage, i.e. deletes some files and returns new storage usage statistics. Secret thumbnails can't be deleted

     - ReturnType: `TDObject.StorageStatistics`
     */
    struct OptimizeStorage: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.StorageStatistics

        /**
         Limit on the total size of files after deletion. Pass -1 to use the default limit
         */
        public var size: Int64

        /**
         Limit on the time that has passed since the last time a file was accessed (or creation time for some filesystems). Pass -1 to use the default limit
         */
        public var ttl: Int

        /**
         Limit on the total count of files after deletion. Pass -1 to use the default limit
         */
        public var count: Int

        /**
         The amount of time after the creation of a file during which it can't be deleted, in seconds. Pass -1 to use the default value
         */
        public var immunityDelay: Int

        /**
         If not empty, only files with the given type(s) are considered. By default, all types except thumbnails, profile photos, stickers and wallpapers are deleted
         */
        public var fileTypes: [TDEnum.FileType]

        /**
         If not empty, only files from the given chats are considered. Use 0 as chat identifier to delete files not belonging to any chat (e.g., profile photos)
         */
        public var chatIds: [Int64]

        /**
         If not empty, files from the given chats are excluded. Use 0 as chat identifier to exclude all files not belonging to any chat (e.g., profile photos)
         */
        public var excludeChatIds: [Int64]

        /**
         Same as in getStorageStatistics. Affects only returned statistics
         */
        public var chatLimit: Int

        /**
         Optimizes storage usage, i.e. deletes some files and returns new storage usage statistics. Secret thumbnails can't be deleted

         - Parameter size: Limit on the total size of files after deletion. Pass -1 to use the default limit
         - Parameter ttl: Limit on the time that has passed since the last time a file was accessed (or creation time for some filesystems). Pass -1 to use the default limit
         - Parameter count: Limit on the total count of files after deletion. Pass -1 to use the default limit
         - Parameter immunityDelay: The amount of time after the creation of a file during which it can't be deleted, in seconds. Pass -1 to use the default value
         - Parameter fileTypes: If not empty, only files with the given type(s) are considered. By default, all types except thumbnails, profile photos, stickers and wallpapers are deleted
         - Parameter chatIds: If not empty, only files from the given chats are considered. Use 0 as chat identifier to delete files not belonging to any chat (e.g., profile photos)
         - Parameter excludeChatIds: If not empty, files from the given chats are excluded. Use 0 as chat identifier to exclude all files not belonging to any chat (e.g., profile photos)
         - Parameter chatLimit: Same as in getStorageStatistics. Affects only returned statistics
         */
        public init(size: Int64, ttl: Int, count: Int, immunityDelay: Int, fileTypes: [TDEnum.FileType], chatIds: [Int64], excludeChatIds: [Int64], chatLimit: Int) {
            self.size = size
            self.ttl = ttl
            self.count = count
            self.immunityDelay = immunityDelay
            self.fileTypes = fileTypes
            self.chatIds = chatIds
            self.excludeChatIds = excludeChatIds
            self.chatLimit = chatLimit
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            size = try container.decodeInt64(forKey: .init(string: "size"))
            ttl = try container.decode(Int.self, forKey: .init(string: "ttl"))
            count = try container.decode(Int.self, forKey: .init(string: "count"))
            immunityDelay = try container.decode(Int.self, forKey: .init(string: "immunityDelay"))
            fileTypes = try container.decode([TDEnum.FileType].self, forKey: .init(string: "fileTypes"))
            chatIds = try container.decodeInt64Array(forKey: .init(string: "chatIds"))
            excludeChatIds = try container.decodeInt64Array(forKey: .init(string: "excludeChatIds"))
            chatLimit = try container.decode(Int.self, forKey: .init(string: "chatLimit"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(size, forKey: .init(string: "size"))
            try container.encode(ttl, forKey: .init(string: "ttl"))
            try container.encode(count, forKey: .init(string: "count"))
            try container.encode(immunityDelay, forKey: .init(string: "immunityDelay"))
            try container.encode(fileTypes, forKey: .init(string: "fileTypes"))
            try container.encodeInt64Array(chatIds, forKey: .init(string: "chatIds"))
            try container.encodeInt64Array(excludeChatIds, forKey: .init(string: "excludeChatIds"))
            try container.encode(chatLimit, forKey: .init(string: "chatLimit"))
        }
    }
}
