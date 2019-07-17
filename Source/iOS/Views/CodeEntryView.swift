//
//  CodeEntryView.swift
//  Swiftygram
//
//  Created by Oleksandr Zhuhan on 7/17/19.
//

import UIKit

class CodeEntryView: UIView, NibBasedView, AuthorizationContentView {
    
    @IBOutlet var imageView: UIImageView! {
        didSet {
            
        }
    }
    
    @IBOutlet var imageBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet var titleLabel: UILabel! {
        didSet {
            
        }
    }
    
    @IBOutlet var titleTopEdgeConstraint: NSLayoutConstraint!
    
    @IBOutlet var subtitleLabel: UILabel! {
        didSet {
            
        }
    }
    
    @IBOutlet var codeTextField: UITextField! {
        didSet {
            
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
    
    @IBOutlet var resendButton: UIButton! {
        didSet {
            
        }
    }
    
    var isProcessing = false {
        didSet {
            
        }
    }

}
