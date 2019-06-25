//
//  SavedCredentials.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains information about saved card credentials
     */
    struct SavedCredentials: TDObjectProtocol {
        /**
         Unique identifier of the saved credentials
         */
        public let id: String

        /**
         Title of the saved credentials
         */
        public let title: String

        /**
         Contains information about saved card credentials

         - Parameter id: Unique identifier of the saved credentials
         - Parameter title: Title of the saved credentials
         */
        public init(id: String, title: String) {
            self.id = id
            self.title = title
        }
    }
}
