//
//  GetSavedOrderInfo.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns saved order info, if any

     - ReturnType: `TDObject.OrderInfo`
     */
    struct GetSavedOrderInfo: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.OrderInfo

        /**
         Returns saved order info, if any
         */
        public init() {}
    }
}
