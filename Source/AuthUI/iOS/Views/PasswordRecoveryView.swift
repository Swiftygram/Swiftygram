//
//  PasswordRecoveryView.swift
//  Swiftygram
//
//  Created by Oleksandr Zhuhan on 7/19/19.
//

import UIKit

class PasswordRecoveryView: UIView, NibBasedView, AuthorizationContentView {
    
    @IBOutlet var titleLabel: UILabel! {
        didSet {
            titleLabel.text = L.LoginPassword.RecoveryTitle
        }
    }
    
    @IBOutlet var subtitleLabel: UILabel! {
        didSet {
            titleLabel.text = L.TwoStepAuth.RecoveryCodeHelp
        }
    }
    
    @IBOutlet var passwordTextField: UITextField! {
        didSet {
            passwordTextField.placeholder = L.TwoStepAuth.RecoveryCode
        }
    }
    
    @IBOutlet var separatorView: UIView! {
        didSet {
            separatorView.backgroundColor = Constants.separatorColor
        }
    }
    
    @IBOutlet var separatorHeightConstraint: NSLayoutConstraint! {
        didSet {
            separatorHeightConstraint.constant = Constants.separatorSize
        }
    }
    
    @IBOutlet var emailLabel: UILabel!
    
    var isProcessing = false {
        didSet {
            
        }
    }

}
