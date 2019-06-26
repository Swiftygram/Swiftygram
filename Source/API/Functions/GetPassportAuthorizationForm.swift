//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns a Telegram Passport authorization form for sharing data with a service

     - ReturnType: `TDObject.PassportAuthorizationForm`
     */
    struct GetPassportAuthorizationForm: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.PassportAuthorizationForm

        /**
         User identifier of the service's bot
         */
        public var botUserId: Int

        /**
         Telegram Passport element types requested by the service
         */
        public var scope: String

        /**
         Service's public_key
         */
        public var publicKey: String

        /**
         Authorization form nonce provided by the service
         */
        public var nonce: String

        /**
         Returns a Telegram Passport authorization form for sharing data with a service

         - Parameter botUserId: User identifier of the service's bot
         - Parameter scope: Telegram Passport element types requested by the service
         - Parameter publicKey: Service's public_key
         - Parameter nonce: Authorization form nonce provided by the service
         */
        public init(botUserId: Int, scope: String, publicKey: String, nonce: String) {
            self.botUserId = botUserId
            self.scope = scope
            self.publicKey = publicKey
            self.nonce = nonce
        }
    }
}
