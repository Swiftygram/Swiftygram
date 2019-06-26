//
//  Text.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains some text
     */
    struct Text: TDObjectProtocol {
        /**
         Text
         */
        public let text: String

        /**
         Contains some text

         - Parameter text: Text
         */
        public init(text: String) {
            self.text = text
        }
    }
}
