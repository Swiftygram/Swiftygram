//
//  GetLanguagePackString.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns a string stored in the local database from the specified localization target and language pack by its key. Returns a 404 error if the string is not found. This is an offline method. Can be called before authorization. Can be called synchronously

     - ReturnType: `TDEnum.LanguagePackStringValue`
     */
    struct GetLanguagePackString: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDEnum.LanguagePackStringValue

        /**
         Path to the language pack database in which strings are stored
         */
        public let languagePackDatabasePath: String

        /**
         Localization target to which the language pack belongs
         */
        public let localizationTarget: String

        /**
         Language pack identifier
         */
        public let languagePackId: String

        /**
         Language pack key of the string to be returned
         */
        public let key: String

        /**
         Returns a string stored in the local database from the specified localization target and language pack by its key. Returns a 404 error if the string is not found. This is an offline method. Can be called before authorization. Can be called synchronously

         - Parameter languagePackDatabasePath: Path to the language pack database in which strings are stored
         - Parameter localizationTarget: Localization target to which the language pack belongs
         - Parameter languagePackId: Language pack identifier
         - Parameter key: Language pack key of the string to be returned
         */
        public init(languagePackDatabasePath: String, localizationTarget: String, languagePackId: String, key: String) {
            self.languagePackDatabasePath = languagePackDatabasePath
            self.localizationTarget = localizationTarget
            self.languagePackId = languagePackId
            self.key = key
        }
    }
}
