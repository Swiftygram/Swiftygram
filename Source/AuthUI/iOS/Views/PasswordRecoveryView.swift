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
            titleLabel.text = L.TwoStepAuth.RecoveryTitle
        }
    }
    
    @IBOutlet var subtitleLabel: UILabel! {
        didSet {
            subtitleLabel.text = L.TwoStepAuth.RecoveryCodeHelp
        }
    }
    
    @IBOutlet var codeTextField: UITextField! {
        didSet {
            codeTextField.placeholder = L.TwoStepAuth.RecoveryCode
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
            codeTextField.alpha = isProcessing ? 0.6 : 1
        }
    }
    
    func activateInput() {
        codeTextField.becomeFirstResponder()
    }

}
