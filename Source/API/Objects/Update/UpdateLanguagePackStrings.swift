//
//  UpdateLanguagePackStrings.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Some language pack strings have been updated
     */
    struct UpdateLanguagePackStrings: TDObject.Update {
        /**
         Localization target to which the language pack belongs
         */
        public let localizationTarget: String

        /**
         Identifier of the updated language pack
         */
        public let languagePackId: String

        /**
         List of changed language pack strings
         */
        public let strings: [TDObject.LanguagePackString]

        /**
         Some language pack strings have been updated

         - Parameter localizationTarget: Localization target to which the language pack belongs
         - Parameter languagePackId: Identifier of the updated language pack
         - Parameter strings: List of changed language pack strings
         */
        public init(localizationTarget: String, languagePackId: String, strings: [TDObject.LanguagePackString]) {
            self.localizationTarget = localizationTarget
            self.languagePackId = languagePackId
            self.strings = strings
        }
    }
}
