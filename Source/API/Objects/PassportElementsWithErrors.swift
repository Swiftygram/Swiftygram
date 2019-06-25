//
//  PassportElementsWithErrors.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains information about a Telegram Passport elements and corresponding errors
     */
    struct PassportElementsWithErrors: TDObjectProtocol {
        /**
         Telegram Passport elements
         */
        public let elements: [TDEnum.PassportElement]

        /**
         Errors in the elements that are already available
         */
        public let errors: [TDObject.PassportElementError]

        /**
         Contains information about a Telegram Passport elements and corresponding errors

         - Parameter elements: Telegram Passport elements
         - Parameter errors: Errors in the elements that are already available
         */
        public init(elements: [TDEnum.PassportElement], errors: [TDObject.PassportElementError]) {
            self.elements = elements
            self.errors = errors
        }
    }
}
