//
//  SetSupergroupDescription.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Changes information about a supergroup or channel; requires appropriate administrator rights

     - ReturnType: `TDObject.Ok`
     */
    struct SetSupergroupDescription: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Identifier of the supergroup or channel
         */
        public let supergroupId: Int

        /**
         New supergroup or channel description; 0-255 characters
         */
        public let description: String

        /**
         Changes information about a supergroup or channel; requires appropriate administrator rights

         - Parameter supergroupId: Identifier of the supergroup or channel
         - Parameter description: New supergroup or channel description; 0-255 characters
         */
        public init(supergroupId: Int, description: String) {
            self.supergroupId = supergroupId
            self.description = description
        }
    }
}
