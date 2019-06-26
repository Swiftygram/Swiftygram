//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Changes the username of a supergroup or channel, requires creator privileges in the supergroup or channel

     - ReturnType: `TDObject.Ok`
     */
    struct SetSupergroupUsername: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Identifier of the supergroup or channel
         */
        public var supergroupId: Int

        /**
         New value of the username. Use an empty string to remove the username
         */
        public var username: String

        /**
         Changes the username of a supergroup or channel, requires creator privileges in the supergroup or channel

         - Parameter supergroupId: Identifier of the supergroup or channel
         - Parameter username: New value of the username. Use an empty string to remove the username
         */
        public init(supergroupId: Int, username: String) {
            self.supergroupId = supergroupId
            self.username = username
        }
    }
}
