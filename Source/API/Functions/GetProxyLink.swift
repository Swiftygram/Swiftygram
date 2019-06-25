//
//  GetProxyLink.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns an HTTPS link, which can be used to add a proxy. Available only for SOCKS5 and MTProto proxies. Can be called before authorization

     - ReturnType: `TDObject.Text`
     */
    struct GetProxyLink: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Text

        /**
         Proxy identifier
         */
        public let proxyId: Int

        /**
         Returns an HTTPS link, which can be used to add a proxy. Available only for SOCKS5 and MTProto proxies. Can be called before authorization

         - Parameter proxyId: Proxy identifier
         */
        public init(proxyId: Int) {
            self.proxyId = proxyId
        }
    }
}
