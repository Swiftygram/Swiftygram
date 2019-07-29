//
//  SendCallDebugInformation.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Sends debug information for a call

     - ReturnType: `TDObject.Ok`
     */
    struct SendCallDebugInformation: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Call identifier
         */
        public var callId: Int

        /**
         Debug information in application-specific format
         */
        public var debugInformation: String

        /**
         Sends debug information for a call

         - Parameter callId: Call identifier
         - Parameter debugInformation: Debug information in application-specific format
         */
        public init(callId: Int, debugInformation: String) {
            self.callId = callId
            self.debugInformation = debugInformation
        }
    }
}
