//
//  TDAuthorizationError.swift
//  Swiftygram
//
//  Created by Oleksandr Zhuhan on 7/17/19.
//

import Foundation

// MARK: - TDAuthorizationError

public enum TDAuthorizationError: Error {
    case internalInconsistency
    case invalidAppGroupId
    case tdLib(TDObject.Error)
    case timedOut
    case cancelled
}

// MARK: - TDPhoneNumberError

public enum TDPhoneNumberError: Error {
    case invalidPhoneNumber
    case limitExceeded
    case phoneLimitExceeded
    case phoneBanned
    case timedOut
    case generic(Error)
    
    init?(error: TDError) {
        switch error {
        case .tdLib(let tdLibError):
            if tdLibError.message.hasPrefix("FLOOD_WAIT") {
                self = .limitExceeded
            } else if tdLibError.message == "PHONE_NUMBER_INVALID" {
                self = .invalidPhoneNumber
            } else if tdLibError.message == "PHONE_NUMBER_FLOOD" {
                self = .phoneLimitExceeded
            } else if tdLibError.message == "PHONE_NUMBER_BANNED" {
                self = .phoneBanned
            } else {
                self = .generic(tdLibError)
            }
            
        case .internalInconsistency(let internalError):
            self = .generic(internalError)
            
        case .timedOut:
            self = .timedOut
            
        case .cancelled:
            return nil
        }
    }
}

// MARK: - TDAuthenticationCodeError

public enum TDAuthenticationCodeError: Error {
    case invalidCode
    case limitExceeded
    case codeExpired
    case timedOut
    case generic(Error)
    
    init?(error: TDError) {
        switch error {
        case .tdLib(let tdLibError):
            if tdLibError.message.hasPrefix("FLOOD_WAIT") {
                self = .limitExceeded
            } else if tdLibError.message == "PHONE_CODE_INVALID" {
                self = .invalidCode
            } else if tdLibError.message == "CODE_HASH_EXPIRED" ||
                tdLibError.message == "PHONE_CODE_EXPIRED" {
                self = .codeExpired
            } else {
                self = .generic(tdLibError)
            }
            
        case .internalInconsistency(let internalError):
            self = .generic(internalError)
            
        case .timedOut:
            self = .timedOut
            
        case .cancelled:
            return nil
        }
    }
}

// MARK: - TDAuthorizationPasswordError

public enum TDAuthenticationPasswordError: Error {
    case limitExceeded
    case invalidPassword
    case timedOut
    case generic(Error)
    
    init?(error: TDError) {
        switch error {
        case .tdLib(let tdLibError):
            if tdLibError.message.hasPrefix("FLOOD_WAIT") {
                self = .limitExceeded
            } else if tdLibError.message == "PASSWORD_HASH_INVALID" {
                self = .invalidPassword
            } else {
                self = .generic(tdLibError)
            }
            
        case .internalInconsistency(let internalError):
            self = .generic(internalError)
            
        case .timedOut:
            self = .timedOut
            
        case .cancelled:
            return nil
        }
    }
}

// MARK: - TDPasswordRecoveryRequestError

public enum TDPasswordRecoveryRequestError: Error {
    case unavailable
    case limitExceeded
    case timedOut
    case generic(Error)
    
    init?(error: TDError) {
        switch error {
        case .tdLib(let tdLibError):
            if tdLibError.message.hasPrefix("FLOOD_WAIT") {
                self = .limitExceeded
            } else if tdLibError.message.hasPrefix("PASSWORD_RECOVERY_NA") {
                self = .unavailable
            } else {
                self = .generic(tdLibError)
            }
            
        case .internalInconsistency(let internalError):
            self = .generic(internalError)
            
        case .timedOut:
            self = .timedOut
            
        case .cancelled:
            return nil
        }
    }
}

// MARK: - TDPasswordRecoveryError

public enum TDPasswordRecoveryError: Error {
    case invalidCode
    case limitExceeded
    case codeExpired
    case timedOut
    
    init?(error: TDError) {
        switch error {
        case .tdLib(let tdLibError):
            if tdLibError.message.hasPrefix("FLOOD_WAIT") {
                self = .limitExceeded
            } else if tdLibError.message.hasPrefix("PASSWORD_RECOVERY_EXPIRED") {
                self = .codeExpired
            } else {
                self = .invalidCode
            }
            
        case .internalInconsistency:
            self = .invalidCode
            
        case .timedOut:
            self = .timedOut
            
        case .cancelled:
            return nil
        }
    }
}

// MARK: - TDSignUpError

public enum TDSignUpError: Error {
    case limitExceeded
    case invalidFirstName
    case invalidLastName
    case timedOut
    case generic(Error)
    
    init?(error: TDError) {
        switch error {
        case .tdLib(let tdLibError):
            if tdLibError.message.hasPrefix("FLOOD_WAIT") {
                self = .limitExceeded
            } else if tdLibError.message == "FIRSTNAME_INVALID" {
                self = .invalidFirstName
            } else if tdLibError.message == "LASTNAME_INVALID" {
                self = .invalidLastName
            } else {
                self = .generic(tdLibError)
            }
            
        case .internalInconsistency(let internalError):
            self = .generic(internalError)
            
        case .timedOut:
            self = .timedOut
            
        case .cancelled:
            return nil
        }
    }
}
