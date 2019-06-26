//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains encrypted Telegram Passport data credentials
     */
    struct EncryptedCredentials: TDObjectProtocol {
        /**
         The encrypted credentials
         */
        public var data: String

        /**
         The decrypted data hash
         */
        public var hash: String

        /**
         Secret for data decryption, encrypted with the service's public key
         */
        public var secret: String

        /**
         Contains encrypted Telegram Passport data credentials

         - Parameter data: The encrypted credentials
         - Parameter hash: The decrypted data hash
         - Parameter secret: Secret for data decryption, encrypted with the service's public key
         */
        public init(data: String, hash: String, secret: String) {
            self.data = data
            self.hash = hash
            self.secret = secret
        }
    }
}
