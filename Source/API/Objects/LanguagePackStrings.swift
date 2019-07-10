//
//  LanguagePackStrings.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains a list of language pack strings
     */
    struct LanguagePackStrings: TDObjectProtocol {
        /**
         A list of language pack strings
         */
        public var strings: [TDObject.LanguagePackString]

        /**
         Contains a list of language pack strings

         - Parameter strings: A list of language pack strings
         */
        public init(strings: [TDObject.LanguagePackString]) {
            self.strings = strings
        }
    }
}
