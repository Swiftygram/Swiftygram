//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Computes time needed to receive a response from a Telegram server through a proxy. Can be called before authorization

     - ReturnType: `TDObject.Seconds`
     */
    struct PingProxy: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Seconds

        /**
         Proxy identifier. Use 0 to ping a Telegram server without a proxy
         */
        public var proxyId: Int

        /**
         Computes time needed to receive a response from a Telegram server through a proxy. Can be called before authorization

         - Parameter proxyId: Proxy identifier. Use 0 to ping a Telegram server without a proxy
         */
        public init(proxyId: Int) {
            self.proxyId = proxyId
        }
    }
}
