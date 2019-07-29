//
//  ClearImportedContacts.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Clears all imported contacts, contact list remains unchanged

     - ReturnType: `TDObject.Ok`
     */
    struct ClearImportedContacts: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Clears all imported contacts, contact list remains unchanged
         */
        public init() {}
    }
}
