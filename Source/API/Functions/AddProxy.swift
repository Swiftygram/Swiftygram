//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Adds a proxy server for network requests. Can be called before authorization

     - ReturnType: `TDObject.Proxy`
     */
    struct AddProxy: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Proxy

        /**
         Proxy server IP address
         */
        public var server: String

        /**
         Proxy server port
         */
        public var port: Int

        /**
         True, if the proxy should be enabled
         */
        public var enable: Bool

        /**
         Proxy type
         */
        public var type: TDEnum.ProxyType

        /**
         Adds a proxy server for network requests. Can be called before authorization

         - Parameter server: Proxy server IP address
         - Parameter port: Proxy server port
         - Parameter enable: True, if the proxy should be enabled
         - Parameter type: Proxy type
         */
        public init(server: String, port: Int, enable: Bool, type: TDEnum.ProxyType) {
            self.server = server
            self.port = port
            self.enable = enable
            self.type = type
        }
    }
}
