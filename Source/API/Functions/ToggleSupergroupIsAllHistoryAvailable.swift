//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Toggles whether the message history of a supergroup is available to new members; requires appropriate administrator rights in the supergroup.

     - ReturnType: `TDObject.Ok`
     */
    struct ToggleSupergroupIsAllHistoryAvailable: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         The identifier of the supergroup
         */
        public var supergroupId: Int

        /**
         The new value of is_all_history_available
         */
        public var isAllHistoryAvailable: Bool

        /**
         Toggles whether the message history of a supergroup is available to new members; requires appropriate administrator rights in the supergroup.

         - Parameter supergroupId: The identifier of the supergroup
         - Parameter isAllHistoryAvailable: The new value of is_all_history_available
         */
        public init(supergroupId: Int, isAllHistoryAvailable: Bool) {
            self.supergroupId = supergroupId
            self.isAllHistoryAvailable = isAllHistoryAvailable
        }
    }
}
