//
//  SetCustomLanguagePackString.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Adds, edits or deletes a string in a custom local language pack. Can be called before authorization

     - ReturnType: `TDObject.Ok`
     */
    struct SetCustomLanguagePackString: TDFunctionProtocol, AuthorizationIndependentFunction {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Identifier of a previously added custom local language pack in the current localization target
         */
        public var languagePackId: String

        /**
         New language pack string
         */
        public var newString: TDObject.LanguagePackString

        /**
         Adds, edits or deletes a string in a custom local language pack. Can be called before authorization

         - Parameter languagePackId: Identifier of a previously added custom local language pack in the current localization target
         - Parameter newString: New language pack string
         */
        public init(languagePackId: String, newString: TDObject.LanguagePackString) {
            self.languagePackId = languagePackId
            self.newString = newString
        }
    }
}
