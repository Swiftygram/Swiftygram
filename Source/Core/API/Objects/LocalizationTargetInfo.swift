//
//  LocalizationTargetInfo.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains information about the current localization target
     */
    struct LocalizationTargetInfo: TDObjectProtocol {
        /**
         List of available language packs for this application
         */
        public var languagePacks: [TDObject.LanguagePackInfo]

        /**
         Contains information about the current localization target

         - Parameter languagePacks: List of available language packs for this application
         */
        public init(languagePacks: [TDObject.LanguagePackInfo]) {
            self.languagePacks = languagePacks
        }
    }
}
