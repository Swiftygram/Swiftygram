//
//  PassportElements.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains information about saved Telegram Passport elements
     */
    struct PassportElements: TDObjectProtocol {
        /**
         Telegram Passport elements
         */
        public let elements: [TDEnum.PassportElement]

        /**
         Contains information about saved Telegram Passport elements

         - Parameter elements: Telegram Passport elements
         */
        public init(elements: [TDEnum.PassportElement]) {
            self.elements = elements
        }
    }
}
