//
//  GetLanguagePackStrings.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns strings from a language pack in the current localization target by their keys. Can be called before authorization

     - ReturnType: `TDObject.LanguagePackStrings`
     */
    struct GetLanguagePackStrings: TDFunctionProtocol, AuthorizationIndependentFunction {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.LanguagePackStrings

        /**
         Language pack identifier of the strings to be returned
         */
        public var languagePackId: String

        /**
         Language pack keys of the strings to be returned; leave empty to request all available strings
         */
        public var keys: [String]

        /**
         Returns strings from a language pack in the current localization target by their keys. Can be called before authorization

         - Parameter languagePackId: Language pack identifier of the strings to be returned
         - Parameter keys: Language pack keys of the strings to be returned; leave empty to request all available strings
         */
        public init(languagePackId: String, keys: [String]) {
            self.languagePackId = languagePackId
            self.keys = keys
        }
    }
}
