//
//  CustomRequestResult.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains the result of a custom request
     */
    struct CustomRequestResult: TDObjectProtocol {
        /**
         A JSON-serialized result
         */
        public var result: String

        /**
         Contains the result of a custom request

         - Parameter result: A JSON-serialized result
         */
        public init(result: String) {
            self.result = result
        }
    }
}
