//
//  CodeEntryView.swift
//  Swiftygram
//
//  Created by Oleksandr Zhuhan on 7/17/19.
//

import UIKit

class CodeEntryView: UIView, NibBasedView, AuthorizationContentView {
    
    @IBOutlet weak var imageView: UIImageView?
    
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var subtitleLabel: UILabel!
    
    @IBOutlet var codeTextField: UITextField! {
        didSet {
            codeTextField.placeholder = L.Login.Code
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
    
    @IBOutlet var resendButtonContainerView: UIView!
    
    @IBOutlet var resendButton: UIButton! {
        didSet {
            resendButton.titleLabel?.font = UIFont.monospacedDigitSystemFont(ofSize: 16, weight: .regular)
        }
    }
    
    var isProcessing = false {
        didSet {
            codeTextField.alpha = isProcessing ? 0.6 : 1
            resendButton.isEnabled = !isProcessing
        }
    }

}
