//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Information about the email address authentication code that was sent
     */
    struct EmailAddressAuthenticationCodeInfo: TDObjectProtocol {
        /**
         Pattern of the email address to which an authentication code was sent
         */
        public var emailAddressPattern: String

        /**
         Length of the code; 0 if unknown
         */
        public var length: Int

        /**
         Information about the email address authentication code that was sent

         - Parameter emailAddressPattern: Pattern of the email address to which an authentication code was sent
         - Parameter length: Length of the code; 0 if unknown
         */
        public init(emailAddressPattern: String, length: Int) {
            self.emailAddressPattern = emailAddressPattern
            self.length = length
        }
    }
}
