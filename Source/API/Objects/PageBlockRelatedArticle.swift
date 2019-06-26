//
//  PageBlockRelatedArticle.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains information about a related article
     */
    struct PageBlockRelatedArticle: TDObjectProtocol {
        /**
         Related article URL
         */
        public let url: URL

        /**
         Article title; may be empty
         */
        public let title: String

        /**
         Article description; may be empty
         */
        public let description: String

        /**
         Article photo; may be null
         */
        public let photo: TDObject.Photo

        /**
         Article author; may be empty
         */
        public let author: String

        /**
         Point in time (Unix timestamp) when the article was published; 0 if unknown
         */
        public let publishDate: Foundation.Date?

        /**
         Contains information about a related article

         - Parameter url: Related article URL
         - Parameter title: Article title; may be empty
         - Parameter description: Article description; may be empty
         - Parameter photo: Article photo; may be null
         - Parameter author: Article author; may be empty
         - Parameter publishDate: Point in time (Unix timestamp) when the article was published; 0 if unknown
         */
        public init(url: URL, title: String, description: String, photo: TDObject.Photo, author: String, publishDate: Foundation.Date?) {
            self.url = url
            self.title = title
            self.description = description
            self.photo = photo
            self.author = author
            self.publishDate = publishDate
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            url = try container.decode(URL.self, forKey: .init(string: "url"))
            title = try container.decode(String.self, forKey: .init(string: "title"))
            description = try container.decode(String.self, forKey: .init(string: "description"))
            photo = try container.decode(TDObject.Photo.self, forKey: .init(string: "photo"))
            author = try container.decode(String.self, forKey: .init(string: "author"))
            publishDate = try container.decodeDateIfPresent(forKey: .init(string: "publishDate"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encode(url, forKey: .init(string: "url"))
            try container.encode(title, forKey: .init(string: "title"))
            try container.encode(description, forKey: .init(string: "description"))
            try container.encode(photo, forKey: .init(string: "photo"))
            try container.encode(author, forKey: .init(string: "author"))
            try container.encodeDateIfPresent(publishDate, forKey: .init(string: "publishDate"))
        }
    }
}
