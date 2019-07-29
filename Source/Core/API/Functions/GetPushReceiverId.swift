//
//  GetPushReceiverId.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns a globally unique push notification subscription identifier for identification of an account, which has received a push notification. This is an offline method. Can be called before authorization. Can be called synchronously

     - ReturnType: `TDObject.PushReceiverId`
     */
    struct GetPushReceiverId: TDFunctionProtocol, AuthorizationIndependentFunction {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.PushReceiverId

        /**
         JSON-encoded push notification payload
         */
        public var payload: String

        /**
         Returns a globally unique push notification subscription identifier for identification of an account, which has received a push notification. This is an offline method. Can be called before authorization. Can be called synchronously

         - Parameter payload: JSON-encoded push notification payload
         */
        public init(payload: String) {
            self.payload = payload
        }
    }
}
