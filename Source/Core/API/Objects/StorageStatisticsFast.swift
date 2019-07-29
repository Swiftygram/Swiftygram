//
//  StorageStatisticsFast.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains approximate storage usage statistics, excluding files of unknown file type
     */
    struct StorageStatisticsFast: TDObjectProtocol {
        /**
         Approximate total size of files
         */
        public var filesSize: Int64

        /**
         Approximate number of files
         */
        public var fileCount: Int

        /**
         Size of the database
         */
        public var databaseSize: Int64

        /**
         Size of the language pack database
         */
        public var languagePackDatabaseSize: Int64

        /**
         Size of the TDLib internal log
         */
        public var logSize: Int64

        /**
         Contains approximate storage usage statistics, excluding files of unknown file type

         - Parameter filesSize: Approximate total size of files
         - Parameter fileCount: Approximate number of files
         - Parameter databaseSize: Size of the database
         - Parameter languagePackDatabaseSize: Size of the language pack database
         - Parameter logSize: Size of the TDLib internal log
         */
        public init(filesSize: Int64, fileCount: Int, databaseSize: Int64, languagePackDatabaseSize: Int64, logSize: Int64) {
            self.filesSize = filesSize
            self.fileCount = fileCount
            self.databaseSize = databaseSize
            self.languagePackDatabaseSize = languagePackDatabaseSize
            self.logSize = logSize
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            filesSize = try container.decodeInt64(forKey: .init(string: "filesSize"))
            fileCount = try container.decode(Int.self, forKey: .init(string: "fileCount"))
            databaseSize = try container.decodeInt64(forKey: .init(string: "databaseSize"))
            languagePackDatabaseSize = try container.decodeInt64(forKey: .init(string: "languagePackDatabaseSize"))
            logSize = try container.decodeInt64(forKey: .init(string: "logSize"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(filesSize, forKey: .init(string: "filesSize"))
            try container.encode(fileCount, forKey: .init(string: "fileCount"))
            try container.encodeInt64(databaseSize, forKey: .init(string: "databaseSize"))
            try container.encodeInt64(languagePackDatabaseSize, forKey: .init(string: "languagePackDatabaseSize"))
            try container.encodeInt64(logSize, forKey: .init(string: "logSize"))
        }
    }
}
