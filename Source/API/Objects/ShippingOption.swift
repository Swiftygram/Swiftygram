//
//  ShippingOption.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     One shipping option
     */
    struct ShippingOption: TDObjectProtocol {
        /**
         Shipping option identifier
         */
        public let id: String

        /**
         Option title
         */
        public let title: String

        /**
         A list of objects used to calculate the total shipping costs
         */
        public let priceParts: [TDObject.LabeledPricePart]

        /**
         One shipping option

         - Parameter id: Shipping option identifier
         - Parameter title: Option title
         - Parameter priceParts: A list of objects used to calculate the total shipping costs
         */
        public init(id: String, title: String, priceParts: [TDObject.LabeledPricePart]) {
            self.id = id
            self.title = title
            self.priceParts = priceParts
        }
    }
}
