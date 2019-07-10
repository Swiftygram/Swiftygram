//
//  EditCustomLanguagePackInfo.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Edits information about a custom local language pack in the current localization target. Can be called before authorization

     - ReturnType: `TDObject.Ok`
     */
    struct EditCustomLanguagePackInfo: TDFunctionProtocol, AuthorizationIndependentFunction {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         New information about the custom local language pack
         */
        public var info: TDObject.LanguagePackInfo

        /**
         Edits information about a custom local language pack in the current localization target. Can be called before authorization

         - Parameter info: New information about the custom local language pack
         */
        public init(info: TDObject.LanguagePackInfo) {
            self.info = info
        }
    }
}
