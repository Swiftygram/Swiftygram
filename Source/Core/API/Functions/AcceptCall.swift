//
//  AcceptCall.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Accepts an incoming call

     - ReturnType: `TDObject.Ok`
     */
    struct AcceptCall: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Call identifier
         */
        public var callId: Int

        /**
         Description of the call protocols supported by the client
         */
        public var `protocol`: TDObject.CallProtocol

        /**
         Accepts an incoming call

         - Parameter callId: Call identifier
         - Parameter protocol: Description of the call protocols supported by the client
         */
        public init(callId: Int, protocol: TDObject.CallProtocol) {
            self.callId = callId
            self.protocol = `protocol`
        }
    }
}
