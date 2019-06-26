//
//  SetCustomLanguagePack.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Adds or changes a custom local language pack to the current localization target

     - ReturnType: `TDObject.Ok`
     */
    struct SetCustomLanguagePack: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Information about the language pack. Language pack ID must start with 'X', consist only of English letters, digits and hyphens, and must not exceed 64 characters. Can be called before authorization
         */
        public let info: TDObject.LanguagePackInfo

        /**
         Strings of the new language pack
         */
        public let strings: [TDObject.LanguagePackString]

        /**
         Adds or changes a custom local language pack to the current localization target

         - Parameter info: Information about the language pack. Language pack ID must start with 'X', consist only of English letters, digits and hyphens, and must not exceed 64 characters. Can be called before authorization
         - Parameter strings: Strings of the new language pack
         */
        public init(info: TDObject.LanguagePackInfo, strings: [TDObject.LanguagePackString]) {
            self.info = info
            self.strings = strings
        }
    }
}
