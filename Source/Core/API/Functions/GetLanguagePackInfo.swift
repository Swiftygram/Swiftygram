//
//  GetLanguagePackInfo.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns information about a language pack. Returned language pack identifier may be different from a provided one. Can be called before authorization

     - ReturnType: `TDObject.LanguagePackInfo`
     */
    struct GetLanguagePackInfo: TDFunctionProtocol, AuthorizationIndependentFunction {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.LanguagePackInfo

        /**
         Language pack identifier
         */
        public var languagePackId: String

        /**
         Returns information about a language pack. Returned language pack identifier may be different from a provided one. Can be called before authorization

         - Parameter languagePackId: Language pack identifier
         */
        public init(languagePackId: String) {
            self.languagePackId = languagePackId
        }
    }
}
