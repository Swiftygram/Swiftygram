//
//  AddCustomServerLanguagePack.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Adds a custom server language pack to the list of installed language packs in current localization target. Can be called before authorization

     - ReturnType: `TDObject.Ok`
     */
    struct AddCustomServerLanguagePack: TDFunctionProtocol, AuthorizationIndependentFunction {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Identifier of a language pack to be added; may be different from a name that is used in an "https://t.me/setlanguage/" link
         */
        public var languagePackId: String

        /**
         Adds a custom server language pack to the list of installed language packs in current localization target. Can be called before authorization

         - Parameter languagePackId: Identifier of a language pack to be added; may be different from a name that is used in an "https://t.me/setlanguage/" link
         */
        public init(languagePackId: String) {
            self.languagePackId = languagePackId
        }
    }
}
