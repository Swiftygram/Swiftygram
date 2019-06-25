//
//  DeleteLanguagePack.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Deletes all information about a language pack in the current localization target. The language pack which is currently in use (including base language pack) or is being synchronized can't be deleted. Can be called before authorization

     - ReturnType: `TDObject.Ok`
     */
    struct DeleteLanguagePack: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Identifier of the language pack to delete
         */
        public let languagePackId: String

        /**
         Deletes all information about a language pack in the current localization target. The language pack which is currently in use (including base language pack) or is being synchronized can't be deleted. Can be called before authorization

         - Parameter languagePackId: Identifier of the language pack to delete
         */
        public init(languagePackId: String) {
            self.languagePackId = languagePackId
        }
    }
}
