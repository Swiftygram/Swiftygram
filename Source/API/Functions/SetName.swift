//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Changes the first and last name of the current user. If something changes, updateUser will be sent

     - ReturnType: `TDObject.Ok`
     */
    struct SetName: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         The new value of the first name for the user; 1-64 characters
         */
        public var firstName: String

        /**
         The new value of the optional last name for the user; 0-64 characters
         */
        public var lastName: String

        /**
         Changes the first and last name of the current user. If something changes, updateUser will be sent

         - Parameter firstName: The new value of the first name for the user; 1-64 characters
         - Parameter lastName: The new value of the optional last name for the user; 0-64 characters
         */
        public init(firstName: String, lastName: String) {
            self.firstName = firstName
            self.lastName = lastName
        }
    }
}
