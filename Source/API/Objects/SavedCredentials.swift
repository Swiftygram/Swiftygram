//
//  SavedCredentials.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
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
        public var id: String

        /**
         Title of the saved credentials
         */
        public var title: String

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
