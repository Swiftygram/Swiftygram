//
//  StorageStatisticsByFileType.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains the storage usage statistics for a specific file type
     */
    struct StorageStatisticsByFileType: TDObjectProtocol {
        /**
         File type
         */
        public var fileType: TDEnum.FileType

        /**
         Total size of the files
         */
        public var size: Int64

        /**
         Total number of files
         */
        public var count: Int

        /**
         Contains the storage usage statistics for a specific file type

         - Parameter fileType: File type
         - Parameter size: Total size of the files
         - Parameter count: Total number of files
         */
        public init(fileType: TDEnum.FileType, size: Int64, count: Int) {
            self.fileType = fileType
            self.size = size
            self.count = count
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            fileType = try container.decode(TDEnum.FileType.self, forKey: .init(string: "fileType"))
            size = try container.decodeInt64(forKey: .init(string: "size"))
            count = try container.decode(Int.self, forKey: .init(string: "count"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encode(fileType, forKey: .init(string: "fileType"))
            try container.encodeInt64(size, forKey: .init(string: "size"))
            try container.encode(count, forKey: .init(string: "count"))
        }
    }
}
