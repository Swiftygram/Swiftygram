//
//  PassportRequiredElement.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains a description of the required Telegram Passport element that was requested by a service
     */
    struct PassportRequiredElement: TDObjectProtocol {
        /**
         List of Telegram Passport elements any of which is enough to provide
         */
        public let suitableElements: [TDObject.PassportSuitableElement]

        /**
         Contains a description of the required Telegram Passport element that was requested by a service

         - Parameter suitableElements: List of Telegram Passport elements any of which is enough to provide
         */
        public init(suitableElements: [TDObject.PassportSuitableElement]) {
            self.suitableElements = suitableElements
        }
    }
}
