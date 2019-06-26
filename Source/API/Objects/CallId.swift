//
//  CallId.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains the call identifier
     */
    struct CallId: TDObjectProtocol {
        /**
         Call identifier
         */
        public let id: Int

        /**
         Contains the call identifier

         - Parameter id: Call identifier
         */
        public init(id: Int) {
            self.id = id
        }
    }
}
