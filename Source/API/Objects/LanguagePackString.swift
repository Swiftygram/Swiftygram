//
//  LanguagePackString.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Represents one language pack string
     */
    struct LanguagePackString: TDObjectProtocol {
        /**
         String key
         */
        public var key: String

        /**
         String value
         */
        public var value: TDEnum.LanguagePackStringValue

        /**
         Represents one language pack string

         - Parameter key: String key
         - Parameter value: String value
         */
        public init(key: String, value: TDEnum.LanguagePackStringValue) {
            self.key = key
            self.value = value
        }
    }
}
