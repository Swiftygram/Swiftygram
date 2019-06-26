//
//  IdentityDocument.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     An identity document
     */
    struct IdentityDocument: TDObjectProtocol {
        /**
         Document number; 1-24 characters
         */
        public let number: String

        /**
         Document expiry date; may be null
         */
        public let expiryDate: TDObject.Date

        /**
         Front side of the document
         */
        public let frontSide: TDObject.DatedFile

        /**
         Reverse side of the document; only for driver license and identity card
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
         An identity document

         - Parameter number: Document number; 1-24 characters
         - Parameter expiryDate: Document expiry date; may be null
         - Parameter frontSide: Front side of the document
         - Parameter reverseSide: Reverse side of the document; only for driver license and identity card
         - Parameter selfie: Selfie with the document; may be null
         - Parameter translation: List of files containing a certified English translation of the document
         */
        public init(number: String, expiryDate: TDObject.Date, frontSide: TDObject.DatedFile, reverseSide: TDObject.DatedFile, selfie: TDObject.DatedFile, translation: [TDObject.DatedFile]) {
            self.number = number
            self.expiryDate = expiryDate
            self.frontSide = frontSide
            self.reverseSide = reverseSide
            self.selfie = selfie
            self.translation = translation
        }
    }
}
