//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     An identity document to be saved to Telegram Passport
     */
    struct InputIdentityDocument: TDObjectProtocol {
        /**
         Document number; 1-24 characters
         */
        public var number: String

        /**
         Document expiry date, if available
         */
        public var expiryDate: TDObject.Date?

        /**
         Front side of the document
         */
        public var frontSide: TDEnum.InputFile

        /**
         Reverse side of the document; only for driver license and identity card
         */
        public var reverseSide: TDEnum.InputFile

        /**
         Selfie with the document, if available
         */
        public var selfie: TDEnum.InputFile?

        /**
         List of files containing a certified English translation of the document
         */
        public var translation: [TDEnum.InputFile]

        /**
         An identity document to be saved to Telegram Passport

         - Parameter number: Document number; 1-24 characters
         - Parameter expiryDate: Document expiry date, if available
         - Parameter frontSide: Front side of the document
         - Parameter reverseSide: Reverse side of the document; only for driver license and identity card
         - Parameter selfie: Selfie with the document, if available
         - Parameter translation: List of files containing a certified English translation of the document
         */
        public init(number: String, expiryDate: TDObject.Date?, frontSide: TDEnum.InputFile, reverseSide: TDEnum.InputFile, selfie: TDEnum.InputFile?, translation: [TDEnum.InputFile]) {
            self.number = number
            self.expiryDate = expiryDate
            self.frontSide = frontSide
            self.reverseSide = reverseSide
            self.selfie = selfie
            self.translation = translation
        }
    }
}
