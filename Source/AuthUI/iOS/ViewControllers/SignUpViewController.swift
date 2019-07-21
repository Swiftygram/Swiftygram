//
//  SignUpViewController.swift
//  Swiftygram
//
//  Created by KY1VSTAR on 7/21/19.
//

import UIKit

class SignUpViewController: AuthorizationBaseViewController<SignUpView> {
    
    private let isTermsOfServiceAvailable: Bool
    
    init(isTermsOfServiceAvailable: Bool) {
        self.isTermsOfServiceAvailable = isTermsOfServiceAvailable
        
        super.init(contentView: .instantiateFromNib(), showsCancelButton: true)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }
    
    // MARK: - Setup
    
    private func setupViews() {
        contentView.firstNameTextField.delegate = self
        contentView.lastNameTextField.delegate = self
        
        setupTerms()
    }
    
    private func setupTerms() {
        contentView.termsButton?.addTarget(self, action: #selector(termsButtonTapped), for: .touchUpInside)
        
        if isTermsOfServiceAvailable {
            contentView.termsButton?.setAttributedTitle(termsOfServiceTitle(), for: [])
            return
        }
        
        contentView.termsButton?.removeFromSuperview()
        
        contentView.lastNameSeparatorView.translatesAutoresizingMaskIntoConstraints = false
        contentView.lastNameSeparatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16).isActive = true
    }
    
    private func termsOfServiceTitle() -> NSAttributedString {
        let str = L.Login.TermsOfServiceLabel
        let nsString = str as NSString
        
        let attrStr = NSMutableAttributedString(string: str, attributes: [
            .font: UIFont.systemFont(ofSize: 16),
            .foregroundColor: UIColor.black
            ])
        
        let regEx = try! NSRegularExpression(pattern: "\\[([^\\]]+)\\]", options: [])
        
        let matches = regEx.matches(in: str, options: [], range: NSMakeRange(0, nsString.length))
        
        for match in matches.reversed() {
            let link = nsString.substring(with: match.range(at: 1))
            let linkString = NSAttributedString(string: link, attributes: [
                .font: UIFont.systemFont(ofSize: 16),
                .foregroundColor: Constants.accentColor
                ])
            
            attrStr.replaceCharacters(in: match.range(at: 0), with: linkString)
        }
        
        return attrStr
    }
    
    // MARK: - Actions
    
    private func signUp() {
        let firstName = contentView.firstNameTextField.text ?? ""
        let lastName = contentView.lastNameTextField.text ?? ""
        
        if firstName.isEmpty {
            contentView.firstNameTextField.layer.addShakeAnimation()
            return
        }
        
        authorizer?.signUp(with: firstName, lastName: lastName, completionHandler: genericErrorHandler())
    }
    
    override func nextButtonTapped() {
        signUp()
    }
    
    private func superCancelButtonTapped() {
        super.cancelButtonTapped()
    }
    
    override func cancelButtonTapped() {
        let controller = UIAlertController(title: nil, message: L.Login.CancelSignUpConfirmation, preferredStyle: .alert)
        
        controller.addAction(UIAlertAction(title: L.Login.CancelPhoneVerificationContinue, style: .cancel, handler: nil))
        
        controller.addAction(UIAlertAction(title: L.Login.CancelPhoneVerificationStop, style: .default, handler: { [weak self] _ in
            self?.superCancelButtonTapped()
        }))
        
        present(controller, animated: true, completion: nil)
    }
    
    @objc private func termsButtonTapped() {
        authorizationViewController?.showTermsOfService(ifNecessarily: false)
    }

}

// MARK: - UITextFieldDelegate

extension SignUpViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return !isProcessing
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField === contentView.firstNameTextField {
            contentView.lastNameTextField.becomeFirstResponder()
        } else {
            signUp()
        }
        
        return false
    }
}
