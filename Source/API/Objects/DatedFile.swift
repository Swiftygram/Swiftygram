//
//  DatedFile.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     File with the date it was uploaded
     */
    struct DatedFile: TDObjectProtocol {
        /**
         The file
         */
        public let file: TDObject.File

        /**
         Point in time (Unix timestamp) when the file was uploaded
         */
        public let date: Foundation.Date

        /**
         File with the date it was uploaded

         - Parameter file: The file
         - Parameter date: Point in time (Unix timestamp) when the file was uploaded
         */
        public init(file: TDObject.File, date: Foundation.Date) {
            self.file = file
            self.date = date
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            file = try container.decode(TDObject.File.self, forKey: .init(string: "file"))
            date = try container.decodeDate(forKey: .init(string: "date"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encode(file, forKey: .init(string: "file"))
            try container.encodeDate(date, forKey: .init(string: "date"))
        }
    }
}
