//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Changes the database encryption key. Usually the encryption key is never changed and is stored in some OS keychain

     - ReturnType: `TDObject.Ok`
     */
    struct SetDatabaseEncryptionKey: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         New encryption key
         */
        public var newEncryptionKey: String

        /**
         Changes the database encryption key. Usually the encryption key is never changed and is stored in some OS keychain

         - Parameter newEncryptionKey: New encryption key
         */
        public init(newEncryptionKey: String) {
            self.newEncryptionKey = newEncryptionKey
        }
    }
}
