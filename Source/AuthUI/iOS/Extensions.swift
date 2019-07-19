//
//  Extensions.swift
//  Swiftygram
//
//  Created by Oleksandr Zhuhan on 7/15/19.
//

import Foundation

// MARK: - Locale

extension Locale {
    static let swiftygram = Locale(identifier: L.locale)
}

// MARK: - UIImage

extension UIImage {
    convenience init?(frameworkNamed named: String) {
        self.init(named: named, in: .swiftygram, compatibleWith: nil)
    }
}

// MARK: - String

extension String {
    var removingNonDigits: String {
        return String(filter("0123456789".contains))
    }
}

// MARK: - CALayer

extension CALayer {
    func addShakeAnimation() {
        let amplitude: CGFloat = 3
        let duration: Double = 0.3
        let count = 4
        let decay = false
        
        let animation = CAKeyframeAnimation(keyPath: "position.x")
        
        let  values: [NSNumber] = [0.0] + (0..<count).map { i in
            let sign: CGFloat = (i % 2 == 0) ? 1.0 : -1.0
            let multiplier = decay ? 1.0 / CGFloat(i + 1) : 1.0
            
            return (amplitude * sign * multiplier) as NSNumber
        }

        animation.values = values
        
        let keyTimes: [NSNumber] = (0..<values.count).map { i in
            if i == 0 {
                return 0.0
            } else if i == values.count - 1 {
                return 1.0
            } else {
                return (Double(i) / Double(values.count - 1)) as NSNumber
            }
        }
        
        animation.keyTimes = keyTimes
        animation.duration = duration
        animation.isAdditive = true
        
        self.add(animation, forKey: "shake")
    }
}

// MARK: - TDPhoneNumberError

extension TDPhoneNumberError {
    var localizedMessage: String {
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

extension TDAuthenticationCodeError {
    var localizedMessage: String {
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

extension TDAuthorizationPasswordError {
    var localizedMessage: String {
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

extension TDPasswordRecoveryRequestError {
    var localizedMessage: String {
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

extension TDPasswordRecoveryError {
    var localizedMessage: String {
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

extension TDSignUpError {
    var localizedMessage: String {
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
