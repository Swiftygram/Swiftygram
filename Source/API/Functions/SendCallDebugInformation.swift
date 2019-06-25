//
//  SendCallDebugInformation.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
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
        public let callId: Int

        /**
         Debug information in application-specific format
         */
        public let debugInformation: String

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
