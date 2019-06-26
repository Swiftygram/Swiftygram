//
//  Updates.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains a list of updates
     */
    struct Updates: TDObjectProtocol {
        /**
         List of updates
         */
        public let updates: [TDObject.Update]

        /**
         Contains a list of updates

         - Parameter updates: List of updates
         */
        public init(updates: [TDObject.Update]) {
            self.updates = updates
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            updates = try container.decode(SubclassCodable<[TDObject.Update]>.self, forKey: .init(string: "updates")).value
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encode(SubclassCodable(value: updates), forKey: .init(string: "updates"))
        }
    }
}
