//
//  DeleteSavedOrderInfo.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Deletes saved order info

     - ReturnType: `TDObject.Ok`
     */
    struct DeleteSavedOrderInfo: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Deletes saved order info
         */
        public init() {}
    }
}
