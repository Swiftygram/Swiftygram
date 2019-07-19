//
//  EnableProxy.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Enables a proxy. Only one proxy can be enabled at a time. Can be called before authorization

     - ReturnType: `TDObject.Ok`
     */
    struct EnableProxy: TDFunctionProtocol, AuthorizationIndependentFunction {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Proxy identifier
         */
        public var proxyId: Int

        /**
         Enables a proxy. Only one proxy can be enabled at a time. Can be called before authorization

         - Parameter proxyId: Proxy identifier
         */
        public init(proxyId: Int) {
            self.proxyId = proxyId
        }
    }
}
