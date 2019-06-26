//
//  AuthenticationCodeInfo.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Information about the authentication code that was sent
     */
    struct AuthenticationCodeInfo: TDObjectProtocol {
        /**
         A phone number that is being authenticated
         */
        public let phoneNumber: String

        /**
         Describes the way the code was sent to the user
         */
        public let type: TDEnum.AuthenticationCodeType

        /**
         Describes the way the next code will be sent to the user; may be null
         */
        public let nextType: TDEnum.AuthenticationCodeType

        /**
         Timeout before the code should be re-sent, in seconds
         */
        public let timeout: Int

        /**
         Information about the authentication code that was sent

         - Parameter phoneNumber: A phone number that is being authenticated
         - Parameter type: Describes the way the code was sent to the user
         - Parameter nextType: Describes the way the next code will be sent to the user; may be null
         - Parameter timeout: Timeout before the code should be re-sent, in seconds
         */
        public init(phoneNumber: String, type: TDEnum.AuthenticationCodeType, nextType: TDEnum.AuthenticationCodeType, timeout: Int) {
            self.phoneNumber = phoneNumber
            self.type = type
            self.nextType = nextType
            self.timeout = timeout
        }
    }
}
