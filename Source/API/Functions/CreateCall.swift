//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Creates a new call

     - ReturnType: `TDObject.CallId`
     */
    struct CreateCall: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.CallId

        /**
         Identifier of the user to be called
         */
        public var userId: Int

        /**
         Description of the call protocols supported by the client
         */
        public var `protocol`: TDObject.CallProtocol

        /**
         Creates a new call

         - Parameter userId: Identifier of the user to be called
         - Parameter protocol: Description of the call protocols supported by the client
         */
        public init(userId: Int, protocol: TDObject.CallProtocol) {
            self.userId = userId
            self.protocol = `protocol`
        }
    }
}
