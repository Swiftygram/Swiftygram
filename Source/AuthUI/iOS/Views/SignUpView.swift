//
//  SignUpView.swift
//  Swiftygram
//
//  Created by KY1VSTAR on 7/21/19.
//

import UIKit

class SignUpView: UIView, NibBasedView, AuthorizationContentView {
    @IBOutlet var titleLabel: UILabel! {
        didSet {
            titleLabel.text = L.Login.InfoTitle
        }
    }
    
    @IBOutlet var firstNameTextField: UITextField! {
        didSet {
            firstNameTextField.placeholder = L.UserInfo.FirstNamePlaceholder
        }
    }
    
    @IBOutlet var firstNameSeparatorView: UIView! {
        didSet {
            firstNameSeparatorView.backgroundColor = Constants.separatorColor
        }
    }
    
    @IBOutlet var firstNameSeparatorHeightConstraint: NSLayoutConstraint! {
        didSet {
            firstNameSeparatorHeightConstraint.constant = Constants.separatorSize
        }
    }
    
    @IBOutlet var lastNameTextField: UITextField! {
        didSet {
            lastNameTextField.placeholder = L.UserInfo.LastNamePlaceholder
        }
    }
    
    @IBOutlet var lastNameSeparatorView: UIView! {
        didSet {
            lastNameSeparatorView.backgroundColor = Constants.separatorColor
        }
    }
    
    @IBOutlet var lastNameSeparatorHeightConstraint: NSLayoutConstraint! {
        didSet {
            lastNameSeparatorHeightConstraint.constant = Constants.separatorSize
        }
    }
    
    @IBOutlet weak var termsButton: UIButton? {
        didSet {
            termsButton?.titleLabel?.numberOfLines = 0
            termsButton?.titleLabel?.textAlignment = .center
        }
    }
    
    var isProcessing = false {
        didSet {
            termsButton?.isUserInteractionEnabled = !isProcessing
            firstNameTextField.alpha = isProcessing ? 0.6 : 1
            lastNameTextField.alpha = isProcessing ? 0.6 : 1
        }
    }
    
    func activateInput() {
        firstNameTextField.becomeFirstResponder()
    }
}
