//
//  LanguagePackInfo.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
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
        public var id: String

        /**
         Identifier of a base language pack; may be empty. If a string is missed in the language pack, then it should be fetched from base language pack. Unsupported in custom language packs
         */
        public var baseLanguagePackId: String

        /**
         Language name
         */
        public var name: String

        /**
         Name of the language in that language
         */
        public var nativeName: String

        /**
         A language code to be used to apply plural forms. See https://www.unicode.org/cldr/charts/latest/supplemental/language_plural_rules.html for more info
         */
        public var pluralCode: String

        /**
         True, if the language pack is official
         */
        public var isOfficial: Bool

        /**
         True, if the language pack strings are RTL
         */
        public var isRtl: Bool

        /**
         True, if the language pack is a beta language pack
         */
        public var isBeta: Bool

        /**
         True, if the language pack is installed by the current user
         */
        public var isInstalled: Bool

        /**
         Total number of non-deleted strings from the language pack
         */
        public var totalStringCount: Int

        /**
         Total number of translated strings from the language pack
         */
        public var translatedStringCount: Int

        /**
         Total number of non-deleted strings from the language pack available locally
         */
        public var localStringCount: Int

        /**
         Link to language translation interface; empty for custom local language packs
         */
        public var translationUrl: URL

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
