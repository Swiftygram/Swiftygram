//
//  EncryptedPassportElement.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains information about an encrypted Telegram Passport element; for bots only
     */
    struct EncryptedPassportElement: TDObjectProtocol {
        /**
         Type of Telegram Passport element
         */
        public let type: TDEnum.PassportElementType

        /**
         Encrypted JSON-encoded data about the user
         */
        public let data: String

        /**
         The front side of an identity document
         */
        public let frontSide: TDObject.DatedFile

        /**
         The reverse side of an identity document; may be null
         */
        public let reverseSide: TDObject.DatedFile

        /**
         Selfie with the document; may be null
         */
        public let selfie: TDObject.DatedFile

        /**
         List of files containing a certified English translation of the document
         */
        public let translation: [TDObject.DatedFile]

        /**
         List of attached files
         */
        public let files: [TDObject.DatedFile]

        /**
         Unencrypted data, phone number or email address
         */
        public let value: String

        /**
         Hash of the entire element
         */
        public let hash: String

        /**
         Contains information about an encrypted Telegram Passport element; for bots only

         - Parameter type: Type of Telegram Passport element
         - Parameter data: Encrypted JSON-encoded data about the user
         - Parameter frontSide: The front side of an identity document
         - Parameter reverseSide: The reverse side of an identity document; may be null
         - Parameter selfie: Selfie with the document; may be null
         - Parameter translation: List of files containing a certified English translation of the document
         - Parameter files: List of attached files
         - Parameter value: Unencrypted data, phone number or email address
         - Parameter hash: Hash of the entire element
         */
        public init(type: TDEnum.PassportElementType, data: String, frontSide: TDObject.DatedFile, reverseSide: TDObject.DatedFile, selfie: TDObject.DatedFile, translation: [TDObject.DatedFile], files: [TDObject.DatedFile], value: String, hash: String) {
            self.type = type
            self.data = data
            self.frontSide = frontSide
            self.reverseSide = reverseSide
            self.selfie = selfie
            self.translation = translation
            self.files = files
            self.value = value
            self.hash = hash
        }
    }
}
