//
//  Notification.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains information about a notification
     */
    struct Notification: TDObjectProtocol {
        /**
         Unique persistent identifier of this notification
         */
        public let id: Int

        /**
         Notification date
         */
        public let date: Foundation.Date

        /**
         Notification type
         */
        public let type: TDEnum.NotificationType

        /**
         Contains information about a notification

         - Parameter id: Unique persistent identifier of this notification
         - Parameter date: Notification date
         - Parameter type: Notification type
         */
        public init(id: Int, date: Foundation.Date, type: TDEnum.NotificationType) {
            self.id = id
            self.date = date
            self.type = type
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            id = try container.decode(Int.self, forKey: .init(string: "id"))
            date = try container.decodeDate(forKey: .init(string: "date"))
            type = try container.decode(TDEnum.NotificationType.self, forKey: .init(string: "type"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encode(id, forKey: .init(string: "id"))
            try container.encodeDate(date, forKey: .init(string: "date"))
            try container.encode(type, forKey: .init(string: "type"))
        }
    }
}
