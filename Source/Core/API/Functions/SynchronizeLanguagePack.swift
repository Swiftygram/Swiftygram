//
//  SynchronizeLanguagePack.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Fetches the latest versions of all strings from a language pack in the current localization target from the server. This method doesn't need to be called explicitly for the current used/base language packs. Can be called before authorization

     - ReturnType: `TDObject.Ok`
     */
    struct SynchronizeLanguagePack: TDFunctionProtocol, AuthorizationIndependentFunction {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Language pack identifier
         */
        public var languagePackId: String

        /**
         Fetches the latest versions of all strings from a language pack in the current localization target from the server. This method doesn't need to be called explicitly for the current used/base language packs. Can be called before authorization

         - Parameter languagePackId: Language pack identifier
         */
        public init(languagePackId: String) {
            self.languagePackId = languagePackId
        }
    }
}
