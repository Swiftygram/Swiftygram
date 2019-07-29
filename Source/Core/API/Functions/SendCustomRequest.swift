//
//  SendCustomRequest.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Sends a custom request; for bots only

     - ReturnType: `TDObject.CustomRequestResult`
     */
    struct SendCustomRequest: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.CustomRequestResult

        /**
         The method name
         */
        public var method: String

        /**
         JSON-serialized method parameters
         */
        public var parameters: String

        /**
         Sends a custom request; for bots only

         - Parameter method: The method name
         - Parameter parameters: JSON-serialized method parameters
         */
        public init(method: String, parameters: String) {
            self.method = method
            self.parameters = parameters
        }
    }
}
