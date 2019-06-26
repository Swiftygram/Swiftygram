//
//  RemoveProxy.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Removes a proxy server. Can be called before authorization

     - ReturnType: `TDObject.Ok`
     */
    struct RemoveProxy: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Proxy identifier
         */
        public let proxyId: Int

        /**
         Removes a proxy server. Can be called before authorization

         - Parameter proxyId: Proxy identifier
         */
        public init(proxyId: Int) {
            self.proxyId = proxyId
        }
    }
}
