//
//  GetProxies.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns list of proxies that are currently set up. Can be called before authorization

     - ReturnType: `TDObject.Proxies`
     */
    struct GetProxies: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Proxies

        /**
         Returns list of proxies that are currently set up. Can be called before authorization
         */
        public init() {}
    }
}
