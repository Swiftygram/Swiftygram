//
//  GetApplicationConfig.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns application config, provided by the server. Can be called before authorization

     - ReturnType: `TDEnum.JsonValue`
     */
    struct GetApplicationConfig: TDFunctionProtocol, AuthorizationIndependentFunction {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDEnum.JsonValue

        /**
         Returns application config, provided by the server. Can be called before authorization
         */
        public init() {}
    }
}
