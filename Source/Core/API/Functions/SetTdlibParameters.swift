//
//  SetTdlibParameters.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

extension TDFunction {
    /**
     Sets the parameters for TDLib initialization. Works only when the current authorization state is authorizationStateWaitTdlibParameters

     - ReturnType: `TDObject.Ok`
     */
    struct SetTdlibParameters: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Parameters
         */
        public var parameters: TDObject.TdlibParameters

        /**
         Sets the parameters for TDLib initialization. Works only when the current authorization state is authorizationStateWaitTdlibParameters

         - Parameter parameters: Parameters
         */
        public init(parameters: TDObject.TdlibParameters) {
            self.parameters = parameters
        }
    }
}
