//
//  ToggleBasicGroupAdministrators.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Toggles the "All members are admins" setting in basic groups; requires creator privileges in the group

     - ReturnType: `TDObject.Ok`
     */
    struct ToggleBasicGroupAdministrators: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Identifier of the basic group
         */
        public let basicGroupId: Int

        /**
         New value of everyone_is_administrator
         */
        public let everyoneIsAdministrator: Bool

        /**
         Toggles the "All members are admins" setting in basic groups; requires creator privileges in the group

         - Parameter basicGroupId: Identifier of the basic group
         - Parameter everyoneIsAdministrator: New value of everyone_is_administrator
         */
        public init(basicGroupId: Int, everyoneIsAdministrator: Bool) {
            self.basicGroupId = basicGroupId
            self.everyoneIsAdministrator = everyoneIsAdministrator
        }
    }
}
