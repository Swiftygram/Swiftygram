//
//  AuthenticationCodeInfo.swift
//  Swiftygram
//
//  Created by KY1VSTAR on 5/25/19.
//  Copyright © 2019 KY1VSTAR. All rights reserved.
//

import Foundation

public extension TGObject {
    
    /**
     * Information about the authentication code that was sent.
     * - Note: https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1authentication_code_info.html
     */
    public class AuthenticationCodeInfo: TGObjectProtocol {
        
        /// A phone number that is being authenticated.
        var phoneNumber: String
        
        /// Describes the way the code was sent to the user.
        var type: TGEnum.AuthenticationCodeType
        
        /// Describes the way the next code will be sent to the user; may be null.
        var nextType: TGEnum.AuthenticationCodeType?
        
        /// Timeout before the code should be re-sent, in seconds.
        var timeout: Int

        /**
         * Information about the authentication code that was sent.
         *
         * - Parameter phoneNumber: A phone number that is being authenticated.
         * - Parameter type: Describes the way the code was sent to the user.
         * - Parameter nextType: Describes the way the next code will be sent to the user; may be null.
         * - Parameter timeout: Timeout before the code should be re-sent, in seconds.
         */
        public init(phoneNumber: String, type: TGEnum.AuthenticationCodeType, nextType: TGEnum.AuthenticationCodeType? = nil, timeout: Int) {
            self.phoneNumber = phoneNumber
            self.type = type
            self.nextType = nextType
            self.timeout = timeout
        }
        
    }
    
}
