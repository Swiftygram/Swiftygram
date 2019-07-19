//
//  SetNetworkType.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Sets the current network type. Can be called before authorization. Calling this method forces all network connections to reopen, mitigating the delay in switching between different networks, so it should be called whenever the network is changed, even if the network type remains the same.-Network type is used to check whether the library can use the network at all and also for collecting detailed network data usage statistics

     - ReturnType: `TDObject.Ok`
     */
    struct SetNetworkType: TDFunctionProtocol, AuthorizationIndependentFunction {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         The new network type. By default, networkTypeOther
         */
        public var type: TDEnum.NetworkType

        /**
         Sets the current network type. Can be called before authorization. Calling this method forces all network connections to reopen, mitigating the delay in switching between different networks, so it should be called whenever the network is changed, even if the network type remains the same.-Network type is used to check whether the library can use the network at all and also for collecting detailed network data usage statistics

         - Parameter type: The new network type. By default, networkTypeOther
         */
        public init(type: TDEnum.NetworkType) {
            self.type = type
        }
    }
}
