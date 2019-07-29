//
//  AuthorizationState.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

extension TDEnum {
    /**
     Represents the current authorization state of the client
     */
    enum AuthorizationState: TDEnumProtocol {
        /**
         TDLib needs TdlibParameters for initialization
         */
        case waitTdlibParameters

        /**
         TDLib needs an encryption key to decrypt the local database

         - isEncrypted: True, if the database is currently encrypted
         */
        case waitEncryptionKey(isEncrypted: Bool)

        /**
         TDLib needs the user's phone number to authorize
         */
        case waitPhoneNumber

        /**
         TDLib needs the user's authentication code to finalize authorization

         - isRegistered: True, if the user is already registered
         - termsOfService: Telegram terms of service, which should be accepted before user can continue registration; may be null
         - codeInfo: Information about the authorization code that was sent
         */
        case waitCode(isRegistered: Bool, termsOfService: TDObject.TermsOfService?, codeInfo: TDObject.AuthenticationCodeInfo)

        /**
         The user has been authorized, but needs to enter a password to start using the application

         - passwordHint: Hint for the password; may be empty
         - hasRecoveryEmailAddress: True if a recovery email address has been set up
         - recoveryEmailAddressPattern: Pattern of the email address to which the recovery email was sent; empty until a recovery email has been sent
         */
        case waitPassword(passwordHint: String, hasRecoveryEmailAddress: Bool, recoveryEmailAddressPattern: String)

        /**
         The user has been successfully authorized. TDLib is now ready to answer queries
         */
        case ready

        /**
         The user is currently logging out
         */
        case loggingOut

        /**
         TDLib is closing, all subsequent queries will be answered with the error 500. Note that closing TDLib can take a while. All resources will be freed only after authorizationStateClosed has been received
         */
        case closing

        /**
         TDLib client is in its final state. All databases are closed and all resources are released. No other updates will be received after this. All queries will be responded to-with error code 500. To continue working, one should create a new instance of the TDLib client
         */
        case closed

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let type = try container.decode(String.self, forKey: .type)

            switch type {
            case "authorizationStateWaitTdlibParameters":
                self = .waitTdlibParameters

            case "authorizationStateWaitEncryptionKey":
                let isEncrypted = try container.decode(Bool.self, forKey: .init(string: "isEncrypted"))

                self = .waitEncryptionKey(isEncrypted: isEncrypted)

            case "authorizationStateWaitPhoneNumber":
                self = .waitPhoneNumber

            case "authorizationStateWaitCode":
                let isRegistered = try container.decode(Bool.self, forKey: .init(string: "isRegistered"))
                let termsOfService = try container.decodeIfPresent(TDObject.TermsOfService.self, forKey: .init(string: "termsOfService"))
                let codeInfo = try container.decode(TDObject.AuthenticationCodeInfo.self, forKey: .init(string: "codeInfo"))

                self = .waitCode(isRegistered: isRegistered, termsOfService: termsOfService, codeInfo: codeInfo)

            case "authorizationStateWaitPassword":
                let passwordHint = try container.decode(String.self, forKey: .init(string: "passwordHint"))
                let hasRecoveryEmailAddress = try container.decode(Bool.self, forKey: .init(string: "hasRecoveryEmailAddress"))
                let recoveryEmailAddressPattern = try container.decode(String.self, forKey: .init(string: "recoveryEmailAddressPattern"))

                self = .waitPassword(passwordHint: passwordHint, hasRecoveryEmailAddress: hasRecoveryEmailAddress, recoveryEmailAddressPattern: recoveryEmailAddressPattern)

            case "authorizationStateReady":
                self = .ready

            case "authorizationStateLoggingOut":
                self = .loggingOut

            case "authorizationStateClosing":
                self = .closing

            case "authorizationStateClosed":
                self = .closed

            default:
                throw DecodingError.typeMismatch(AuthorizationState.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined AuthorizationState"))
            }
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            switch self {
            case .waitTdlibParameters:
                try container.encode("authorizationStateWaitTdlibParameters", forKey: .type)

            case let .waitEncryptionKey(isEncrypted):
                try container.encode("authorizationStateWaitEncryptionKey", forKey: .type)

                try container.encode(isEncrypted, forKey: .init(string: "isEncrypted"))

            case .waitPhoneNumber:
                try container.encode("authorizationStateWaitPhoneNumber", forKey: .type)

            case let .waitCode(isRegistered, termsOfService, codeInfo):
                try container.encode("authorizationStateWaitCode", forKey: .type)

                try container.encode(isRegistered, forKey: .init(string: "isRegistered"))
                try container.encodeIfPresent(termsOfService, forKey: .init(string: "termsOfService"))
                try container.encode(codeInfo, forKey: .init(string: "codeInfo"))

            case let .waitPassword(passwordHint, hasRecoveryEmailAddress, recoveryEmailAddressPattern):
                try container.encode("authorizationStateWaitPassword", forKey: .type)

                try container.encode(passwordHint, forKey: .init(string: "passwordHint"))
                try container.encode(hasRecoveryEmailAddress, forKey: .init(string: "hasRecoveryEmailAddress"))
                try container.encode(recoveryEmailAddressPattern, forKey: .init(string: "recoveryEmailAddressPattern"))

            case .ready:
                try container.encode("authorizationStateReady", forKey: .type)

            case .loggingOut:
                try container.encode("authorizationStateLoggingOut", forKey: .type)

            case .closing:
                try container.encode("authorizationStateClosing", forKey: .type)

            case .closed:
                try container.encode("authorizationStateClosed", forKey: .type)
            }
        }

        public var isWaitTdlibParameters: Bool {
            if case .waitTdlibParameters = self {
                return true
            } else {
                return false
            }
        }

        public var isWaitEncryptionKey: Bool {
            if case .waitEncryptionKey = self {
                return true
            } else {
                return false
            }
        }

        public var isWaitPhoneNumber: Bool {
            if case .waitPhoneNumber = self {
                return true
            } else {
                return false
            }
        }

        public var isWaitCode: Bool {
            if case .waitCode = self {
                return true
            } else {
                return false
            }
        }

        public var isWaitPassword: Bool {
            if case .waitPassword = self {
                return true
            } else {
                return false
            }
        }

        public var isReady: Bool {
            if case .ready = self {
                return true
            } else {
                return false
            }
        }

        public var isLoggingOut: Bool {
            if case .loggingOut = self {
                return true
            } else {
                return false
            }
        }

        public var isClosing: Bool {
            if case .closing = self {
                return true
            } else {
                return false
            }
        }

        public var isClosed: Bool {
            if case .closed = self {
                return true
            } else {
                return false
            }
        }
    }
}
