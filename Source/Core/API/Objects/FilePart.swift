//
//  FilePart.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains a part of a file
     */
    struct FilePart: TDObjectProtocol {
        /**
         File bytes
         */
        public var data: String

        /**
         Contains a part of a file

         - Parameter data: File bytes
         */
        public init(data: String) {
            self.data = data
        }
    }
}
