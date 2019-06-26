//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains a temporary identifier of validated order information, which is stored for one hour. Also contains the available shipping options
     */
    struct ValidatedOrderInfo: TDObjectProtocol {
        /**
         Temporary identifier of the order information
         */
        public var orderInfoId: String

        /**
         Available shipping options
         */
        public var shippingOptions: [TDObject.ShippingOption]

        /**
         Contains a temporary identifier of validated order information, which is stored for one hour. Also contains the available shipping options

         - Parameter orderInfoId: Temporary identifier of the order information
         - Parameter shippingOptions: Available shipping options
         */
        public init(orderInfoId: String, shippingOptions: [TDObject.ShippingOption]) {
            self.orderInfoId = orderInfoId
            self.shippingOptions = shippingOptions
        }
    }
}
