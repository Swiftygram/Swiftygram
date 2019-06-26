//
//  LanguagePackInfo.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains information about a language pack
     */
    struct LanguagePackInfo: TDObjectProtocol {
        /**
         Unique language pack identifier
         */
        public let id: String

        /**
         Identifier of a base language pack; may be empty. If a string is missed in the language pack, then it should be fetched from base language pack. Unsupported in custom language packs
         */
        public let baseLanguagePackId: String

        /**
         Language name
         */
        public let name: String

        /**
         Name of the language in that language
         */
        public let nativeName: String

        /**
         A language code to be used to apply plural forms. See https://www.unicode.org/cldr/charts/latest/supplemental/language_plural_rules.html for more info
         */
        public let pluralCode: String

        /**
         True, if the language pack is official
         */
        public let isOfficial: Bool

        /**
         True, if the language pack strings are RTL
         */
        public let isRtl: Bool

        /**
         True, if the language pack is a beta language pack
         */
        public let isBeta: Bool

        /**
         True, if the language pack is installed by the current user
         */
        public let isInstalled: Bool

        /**
         Total number of non-deleted strings from the language pack
         */
        public let totalStringCount: Int

        /**
         Total number of translated strings from the language pack
         */
        public let translatedStringCount: Int

        /**
         Total number of non-deleted strings from the language pack available locally
         */
        public let localStringCount: Int

        /**
         Link to language translation interface; empty for custom local language packs
         */
        public let translationUrl: URL

        /**
         Contains information about a language pack

         - Parameter id: Unique language pack identifier
         - Parameter baseLanguagePackId: Identifier of a base language pack; may be empty. If a string is missed in the language pack, then it should be fetched from base language pack. Unsupported in custom language packs
         - Parameter name: Language name
         - Parameter nativeName: Name of the language in that language
         - Parameter pluralCode: A language code to be used to apply plural forms. See https://www.unicode.org/cldr/charts/latest/supplemental/language_plural_rules.html for more info
         - Parameter isOfficial: True, if the language pack is official
         - Parameter isRtl: True, if the language pack strings are RTL
         - Parameter isBeta: True, if the language pack is a beta language pack
         - Parameter isInstalled: True, if the language pack is installed by the current user
         - Parameter totalStringCount: Total number of non-deleted strings from the language pack
         - Parameter translatedStringCount: Total number of translated strings from the language pack
         - Parameter localStringCount: Total number of non-deleted strings from the language pack available locally
         - Parameter translationUrl: Link to language translation interface; empty for custom local language packs
         */
        public init(id: String, baseLanguagePackId: String, name: String, nativeName: String, pluralCode: String, isOfficial: Bool, isRtl: Bool, isBeta: Bool, isInstalled: Bool, totalStringCount: Int, translatedStringCount: Int, localStringCount: Int, translationUrl: URL) {
            self.id = id
            self.baseLanguagePackId = baseLanguagePackId
            self.name = name
            self.nativeName = nativeName
            self.pluralCode = pluralCode
            self.isOfficial = isOfficial
            self.isRtl = isRtl
            self.isBeta = isBeta
            self.isInstalled = isInstalled
            self.totalStringCount = totalStringCount
            self.translatedStringCount = translatedStringCount
            self.localStringCount = localStringCount
            self.translationUrl = translationUrl
        }
    }
}
