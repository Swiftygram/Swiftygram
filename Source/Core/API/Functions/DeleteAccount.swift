//
//  DeleteAccount.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Deletes the account of the current user, deleting all information associated with the user from the server. The phone number of the account can be used to create a new account. Can be called before authorization when the current authorization state is authorizationStateWaitPassword

     - ReturnType: `TDObject.Ok`
     */
    struct DeleteAccount: TDFunctionProtocol, AuthorizationIndependentFunction {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         The reason why the account was deleted; optional
         */
        public var reason: String?

        /**
         Deletes the account of the current user, deleting all information associated with the user from the server. The phone number of the account can be used to create a new account. Can be called before authorization when the current authorization state is authorizationStateWaitPassword

         - Parameter reason: The reason why the account was deleted; optional
         */
        public init(reason: String?) {
            self.reason = reason
        }
    }
}
