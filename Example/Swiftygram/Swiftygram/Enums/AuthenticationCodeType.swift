//
//  AuthenticationCodeType.swift
//  Swiftygram
//
//  Created by KY1VSTAR on 5/25/19.
//  Copyright © 2019 KY1VSTAR. All rights reserved.
//

import Foundation

public extension TGEnum {
    
    /**
     * Provides information about the method by which an authentication code is delivered to the user.
     * - Note: https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1_authentication_code_type.html
     */
    public enum AuthenticationCodeType: TGEnumProtocol {
        
        /**
         * An authentication code is delivered via a phone call to the specified phone number.
         */
        case call(length: Int)
        
        /**
         * An authentication code is delivered by an immediately cancelled call to the specified phone number. The number from which the call was made is the code.
         */
        case flashCall(pattern: String)
        
        /// An authentication code is delivered via an SMS message to the specified phone number.
        ///
        /// - length: Length of the code.
        case sms(length: Int)
        
        /**
         * An authentication code is delivered via a private Telegram message, which can be viewed in another client.
         * - length: Length of the code.
         */
        case telegramMessage(length: Int)
        
        
        enum LengthKeys: String, CodingKey {
            case length
        }
        
        enum PatternKeys: String, CodingKey {
            case pattern
        }
        
    }
    
}

extension TGEnum.AuthenticationCodeType {
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: TGTypeKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        
        switch type {
        case "authenticationCodeTypeCall":
            let container = try decoder.container(keyedBy: LengthKeys.self)
            
            let length = try container.decode(Int.self, forKey: .length)
            
            self = .call(length: length)
            
        case "authenticationCodeTypeFlashCall":
            let container = try decoder.container(keyedBy: PatternKeys.self)
            
            let pattern = try container.decode(String.self, forKey: .pattern)
            
            self = .flashCall(pattern: pattern)
            
        case "authenticationCodeTypeSms":
            let container = try decoder.container(keyedBy: LengthKeys.self)
            
            let length = try container.decode(Int.self, forKey: .length)
            
            self = .sms(length: length)
            
        case "authenticationCodeTypeTelegramMessage":
            let container = try decoder.container(keyedBy: LengthKeys.self)
            
            let length = try container.decode(Int.self, forKey: .length)
            
            self = .telegramMessage(length: length)
            
        default:
            throw DecodingError.typeMismatch(TGEnum.AuthenticationCodeType.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined AuthenticationCodeType"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: TGTypeKeys.self)
        
        switch self {
        case .call(let length):
            try container.encode("authenticationCodeTypeCall", forKey: .type)
            
            var container = encoder.container(keyedBy: LengthKeys.self)
            
            try container.encode(length, forKey: .length)
            
        case .flashCall(let pattern):
            try container.encode("authenticationCodeTypeFlashCall", forKey: .type)
            
            var container = encoder.container(keyedBy: PatternKeys.self)
            
            try container.encode(pattern, forKey: .pattern)
            
        case .sms(let length):
            try container.encode("authenticationCodeTypeSms", forKey: .type)
            
            var container = encoder.container(keyedBy: LengthKeys.self)
            
            try container.encode(length, forKey: .length)
            
        case .telegramMessage(let length):
            try container.encode("authenticationCodeTypeTelegramMessage", forKey: .type)
            
            var container = encoder.container(keyedBy: LengthKeys.self)
            
            try container.encode(length, forKey: .length)
        }
    }
    
}
