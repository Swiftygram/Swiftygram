//
//  PasswordRecoveryViewController.swift
//  Swiftygram
//
//  Created by Oleksandr Zhuhan on 7/19/19.
//

import UIKit

class PasswordRecoveryViewController: AuthorizationBaseViewController<PasswordRecoveryView> {
    
    init(recoveryEmailPattern: String) {
        super.init(contentView: .instantiateFromNib(), showsCancelButton: true)
        
        contentView.emailLabel.text = recoveryEmailPattern
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButtonItem.isEnabled = false

        contentView.codeTextField.delegate = self
        contentView.codeTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    // MARK: - Actions
    
    private func confirmCode() {
        authorizer?.setPasswordRecoveryCode(contentView.codeTextField.text ?? "", completionHandler: genericErrorHandler())
    }
    
    override func nextButtonTapped() {
        confirmCode()
    }
    
    @objc private func textFieldDidChange() {
        nextButtonItem.isEnabled = !(contentView.codeTextField.text ?? "").isEmpty
    }
}

// MARK: - UITextFieldDelegate

extension PasswordRecoveryViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return !isProcessing
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        confirmCode()
        return false
    }
}
