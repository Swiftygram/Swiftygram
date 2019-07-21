//
//  PasswordEntryViewController.swift
//  Swiftygram
//
//  Created by Oleksandr Zhuhan on 7/19/19.
//

import UIKit

class PasswordEntryViewController: AuthorizationBaseViewController<PasswordEntryView> {
    
    init(passwordHint: String?) {
        super.init(contentView: .instantiateFromNib(), showsCancelButton: true)
        
        contentView.passwordTextField.placeholder = passwordHint
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButtonItem.isEnabled = false

        contentView.recoveryButton.addTarget(self, action: #selector(recoveryButtonTapped), for: .touchUpInside)
        
        contentView.passwordTextField.delegate = self
        contentView.passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    // MARK: - Actions
    
    private func confirmPassword() {
        authorizer?.setAuthenticationPassword(contentView.passwordTextField.text ?? "", completionHandler: genericErrorHandler())
    }
    
    override func nextButtonTapped() {
        confirmPassword()
    }
    
    @objc private func recoveryButtonTapped() {
        authorizer?.requestPasswordRecovery(with: genericErrorHandler())
    }
    
    @objc private func textFieldDidChange() {
        nextButtonItem.isEnabled = !(contentView.passwordTextField.text ?? "").isEmpty
    }
}

// MARK: - UITextFieldDelegate

extension PasswordEntryViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return !isProcessing
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        confirmPassword()
        return false
    }
}
