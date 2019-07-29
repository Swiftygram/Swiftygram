//
//  CheckDatabaseEncryptionKey.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

extension TDFunction {
    /**
     Checks the database encryption key for correctness. Works only when the current authorization state is authorizationStateWaitEncryptionKey

     - ReturnType: `TDObject.Ok`
     */
    struct CheckDatabaseEncryptionKey: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Encryption key to check or set up
         */
        public var encryptionKey: String

        /**
         Checks the database encryption key for correctness. Works only when the current authorization state is authorizationStateWaitEncryptionKey

         - Parameter encryptionKey: Encryption key to check or set up
         */
        public init(encryptionKey: String) {
            self.encryptionKey = encryptionKey
        }
    }
}
