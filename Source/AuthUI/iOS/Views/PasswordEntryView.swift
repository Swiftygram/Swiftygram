//
//  PasswordEntryView.swift
//  Swiftygram
//
//  Created by Oleksandr Zhuhan on 7/19/19.
//

import UIKit

class PasswordEntryView: UIView, NibBasedView, AuthorizationContentView {
    
    @IBOutlet var titleLabel: UILabel! {
        didSet {
            titleLabel.text = L.LoginPassword.Title
        }
    }
    
    @IBOutlet var subtitleLabel: UILabel! {
        didSet {
            titleLabel.text = L.TwoStepAuth.EnterPasswordHelp
        }
    }
    
    @IBOutlet var passwordTextField: UITextField!
    
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
    
    @IBOutlet var recoveryButton: UIButton! {
        didSet {
            recoveryButton.setTitle(L.TwoStepAuth.EnterPasswordForgot, for: [])
        }
    }
    
    var isProcessing = false {
        didSet {
            
        }
    }

}
