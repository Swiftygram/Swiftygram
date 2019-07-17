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
    
    public var localizedMessage: String {
        switch self {
        case .invalidPhoneNumber:
            return L.Login.InvalidPhoneError
            
        case .limitExceeded:
            return L.Login.CodeFloodError
            
        case .phoneLimitExceeded:
            return L.Login.PhoneFloodError
            
        case .phoneBanned:
            return L.Login.PhoneBannedError
            
        case .timedOut:
            return L.Login.NetworkError
            
        case .generic:
            return L.Login.UnknownError
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
    
    public var localizedMessage: String {
        switch self {
        case .invalidCode:
            return L.Login.InvalidCodeError
            
        case .limitExceeded:
            return L.Login.CodeFloodError
            
        case .codeExpired:
            return L.Login.CodeExpired
            
        case .timedOut:
            return L.Login.NetworkError
            
        case .generic:
            return L.Login.UnknownError
        }
    }
}

// MARK: - TDAuthorizationPasswordError

public enum TDAuthorizationPasswordError: Error {
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
    
    public var localizedMessage: String {
        switch self {
        case .limitExceeded:
            return L.LoginPassword.FloodError
            
        case .invalidPassword:
            return L.LoginPassword.InvalidPasswordError
            
        case .timedOut:
            return L.Login.NetworkError
            
        case .generic:
            return L.Login.UnknownError
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
    
    public var localizedMessage: String {
        switch self {
        case .limitExceeded:
            return L.TwoStepAuth.FloodError
            
        case .unavailable:
            return L.TwoStepAuth.RecoveryUnavailable
            
        case .timedOut:
            return L.Login.NetworkError
            
        case .generic:
            return L.Login.UnknownError
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
    
    public var localizedMessage: String {
        switch self {
        case .limitExceeded:
            return L.LoginPassword.FloodError
            
        case .invalidCode:
            return L.Login.InvalidCodeError
            
        case .codeExpired:
            return L.Login.CodeExpiredError
            
        case .timedOut:
            return L.Login.NetworkError
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
    
    public var localizedMessage: String {
        switch self {
        case .limitExceeded:
            return L.Login.CodeFloodError
            
        case .invalidFirstName:
            return L.Login.InvalidFirstNameError
            
        case .invalidLastName:
            return L.Login.InvalidLastNameError
            
        case .timedOut:
            return L.Login.NetworkError
            
        case .generic:
            return L.Login.UnknownError
        }
    }
}
