//
//  AuthorizationState.swift
//  Swiftygram
//
//  Created by KY1VSTAR on 5/25/19.
//  Copyright © 2019 KY1VSTAR. All rights reserved.
//

import Foundation

public extension TGEnum {
    
    /**
     * Represents the current authorization state of the client.
     * - Note: https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1_authorization_state.html
     */
    public enum AuthorizationState: TGEnumProtocol {
        
        /**
         * TDLib client is in its final state. All databases are closed and all resources are released. No other updates will be received after this. All queries will be responded to with error code 500. To continue working, one should create a new instance of the TDLib client.
         */
        case closed
        
        /**
         * TDLib is closing, all subsequent queries will be answered with the error 500. Note that closing TDLib can take a while. All resources will be freed only after authorizationStateClosed has been received.
         */
        case closing
        
        /**
         * The user is currently logging out.
         */
        case loggingOut
        
        /**
         * The user has been successfully authorized. TDLib is now ready to answer queries.
         */
        case ready
        
        /**
         * TDLib needs the user's authentication code to finalize authorization.
         *
         * - isRegistered: True, if the user is already registered.
         * - termsOfService: Telegram terms of service, which should be accepted before user can continue registration; may be null.
         * - codeInfo: Information about the authorization code that was sent.
         */
        case waitCode(isRegistered: Bool, termsOfService: TGObject.TermsOfService?, codeInfo: TGObject.AuthenticationCodeInfo)
        
        /**
         * TDLib needs an encryption key to decrypt the local database.
         * - isEncrypted: True, if the database is currently encrypted.
         */
        case waitEncryptionKey(isEncrypted: Bool)
        
        /**
         * The user has been authorized, but needs to enter a password to start using the application.
         * - passwordHint: Hint for the password; may be empty.
         * - hasRecoveryEmailAddress: True if a recovery email address has been set up.
         * - recoveryEmailAddressPattern: Pattern of the email address to which the recovery email was sent; empty until a recovery email has been sent.
         */
        case waitPassword(passwordHint: String?, hasRecoveryEmailAddress: Bool, recoveryEmailAddressPattern: String?)
        
        /**
         * TDLib needs the user's phone number to authorize.
         */
        case waitPhoneNumber
        
        /**
         * TDLib needs TdlibParameters for initialization.
         */
        case waitTdlibParameters
        
        // MARK: - AutoCodableTypes
        private static let autoCodableTypes = [AuthorizationState.closed,
                                               .closing,
                                               .loggingOut,
                                               .ready,
                                               .waitPhoneNumber,
                                               .waitTdlibParameters]
        
        private var codableType: String? {
            switch self {
            case .closed:
                return "authorizationStateClosed"
                
            case .closing:
                return "authorizationStateClosing"
                
            case .loggingOut:
                return "authorizationStateLoggingOut"
                
            case .ready:
                return "authorizationStateReady"
                
            case .waitPhoneNumber:
                return "authorizationStateWaitPhoneNumber"
                
            case .waitTdlibParameters:
                return "authorizationStateWaitTdlibParameters"
                
            default:
                return nil
            }
        }
        
        // MARK: - CodingKeys
        enum WaitCodeKeys: String, CodingKey {
            case isRegistered
            case termsOfService
            case codeInfo
        }
        
        enum WaitEncryptionKeys: String, CodingKey {
            case isEncrypted
        }
        
        enum WaitPasswordKeys: String, CodingKey {
            case passwordHint
            case hasRecoveryEmailAddress
            case recoveryEmailAddressPattern
        }
        
        // MARK: - Encodable
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let type = try container.decode(String.self, forKey: .init(string: "@type"))
            
            if let value = AuthorizationState.autoCodableTypes.first(where: { $0.codableType == type }) {
                self = value
                return
            }
            
            switch type {
            case "authorizationStateWaitCode":
                let container = try decoder.container(keyedBy: WaitCodeKeys.self)
                
                let isRegistered = try container.decode(Bool.self, forKey: .isRegistered)
                let termsOfService = try container.decodeIfPresent(TGObject.TermsOfService.self, forKey: .termsOfService)
                let codeInfo = try container.decode(TGObject.AuthenticationCodeInfo.self, forKey: .codeInfo)
                
                self = .waitCode(isRegistered: isRegistered, termsOfService: termsOfService, codeInfo: codeInfo)
                
            case "authorizationStateWaitEncryptionKey":
                let container = try decoder.container(keyedBy: WaitEncryptionKeys.self)
                
                let isEncrypted = try container.decode(Bool.self, forKey: .isEncrypted)
                
                self = .waitEncryptionKey(isEncrypted: isEncrypted)
                
            case "authorizationStateWaitPassword":
                let container = try decoder.container(keyedBy: WaitPasswordKeys.self)
                
                let passwordHint = try container.decodeIfPresent(String.self, forKey: .passwordHint)
                let hasRecoveryEmailAddress = try container.decode(Bool.self, forKey: .hasRecoveryEmailAddress)
                let recoveryEmailAddressPattern = try container.decodeIfPresent(String.self, forKey: .recoveryEmailAddressPattern)
                
                self = .waitPassword(passwordHint: passwordHint, hasRecoveryEmailAddress: hasRecoveryEmailAddress, recoveryEmailAddressPattern: recoveryEmailAddressPattern)
                
            default:
                throw DecodingError.typeMismatch(AuthorizationState.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined AuthorizationState"))
            }
        }
        
        // MARK: - Decodable
        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: TGTypeKeys.self)
            
            if let type = codableType {
                try container.encode(type, forKey: .type)
                return
            }
            
            switch self {
            case .waitCode(let isRegistered, let termsOfService, let codeInfo):
                try container.encode("authorizationStateWaitCode", forKey: .type)
                
                var container = encoder.container(keyedBy: WaitCodeKeys.self)
                
                try container.encode(isRegistered, forKey: .isRegistered)
                try container.encodeIfPresent(termsOfService, forKey: .termsOfService)
                try container.encode(codeInfo, forKey: .codeInfo)
                
            case .waitEncryptionKey(let isEncrypted):
                try container.encode("authorizationStateWaitEncryptionKey", forKey: .type)
                
                var container = encoder.container(keyedBy: WaitEncryptionKeys.self)
                
                try container.encode(isEncrypted, forKey: .isEncrypted)
                
            case .waitPassword(let passwordHint, let hasRecoveryEmailAddress, let recoveryEmailAddressPattern):
                try container.encode("authorizationStateWaitPassword", forKey: .type)
                
                var container = encoder.container(keyedBy: WaitPasswordKeys.self)
                
                try container.encodeIfPresent(passwordHint, forKey: .passwordHint)
                try container.encode(hasRecoveryEmailAddress, forKey: .hasRecoveryEmailAddress)
                try container.encodeIfPresent(recoveryEmailAddressPattern, forKey: .recoveryEmailAddressPattern)
                
            default:
                return
            }
        }
        
    }
    
}
