//
//  SetBotUpdatesStatus.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Informs the server about the number of pending bot updates if they haven't been processed for a long time; for bots only

     - ReturnType: `TDObject.Ok`
     */
    struct SetBotUpdatesStatus: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         The number of pending updates
         */
        public var pendingUpdateCount: Int

        /**
         The last error message
         */
        public var errorMessage: String

        /**
         Informs the server about the number of pending bot updates if they haven't been processed for a long time; for bots only

         - Parameter pendingUpdateCount: The number of pending updates
         - Parameter errorMessage: The last error message
         */
        public init(pendingUpdateCount: Int, errorMessage: String) {
            self.pendingUpdateCount = pendingUpdateCount
            self.errorMessage = errorMessage
        }
    }
}
