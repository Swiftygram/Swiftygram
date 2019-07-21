//
//  AuthorizationViewController.swift
//  Swiftygram
//
//  Created by KY1VSTAR on 7/13/19.
//

import UIKit

// MARK: - AuthorizationViewController
class AuthorizationViewController: UINavigationController {
    
    private var phoneEntryViewController: PhoneEntryViewController?
    
    private var isDismissed = false
    private var shouldHandlePop = true
    private(set) var authorizer: TDAuthorizerSession?
    private var preferredCountryCode: String?
    private var countryManager: CountryManager?
    private var termsOfService: TDObject.TermsOfService?
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()

        showLoadingViewController()
    }
    
    // MARK: - Setup
    
    private func setupNavigationBar() {
        navigationBar.isTranslucent = false
        navigationBar.barTintColor = .white
        navigationBar.shadowImage = UIImage()
    }
    
    private func showLoadingViewController() {
        let controller = AuthorizationBaseViewController<UIView?>(contentView: nil, showsCancelButton: true)
        controller.isProcessing = true
        controller.title = "Telegram"
        
        viewControllers = [controller]
    }
    
    // MARK: - Actions
    
    func cancelButtonTapped() {
        authorizer?.cancelSession()
    }
    
    private func reset() {
        guard let countryManager = countryManager else { return }
        
        let phoneEntryController = PhoneEntryViewController(countryManager: countryManager)
        self.phoneEntryViewController = phoneEntryController
        
        var controllers: [UIViewController] = [phoneEntryController]
        
        if let controller = viewControllers.last {
            shouldHandlePop = false
            
            controllers.append(controller)
            
            viewControllers = controllers
            popToViewController(phoneEntryController, animated: true)
        } else {
            setViewControllers(controllers, animated: true)
        }
    }
    
    func showErrorAlert(with message: String) {
        let controller = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        controller.addAction(UIAlertAction(title: L.Common.OK, style: .cancel, handler: nil))
        
        present(controller, animated: true, completion: nil)
    }
    
    func showTermsOfService(ifNecessarily: Bool) {
        guard let termsOfService = termsOfService else { return }

        if ifNecessarily && !termsOfService.showPopup {
            return
        }

        let controller = UIAlertController(title: L.Login.TermsOfServiceHeader, message: termsOfService.text.text, preferredStyle: .alert)
        
        if ifNecessarily {
            controller.addAction(UIAlertAction(title: L.Login.TermsOfServiceAgree, style: .default, handler: nil))
            
            controller.addAction(UIAlertAction(title: L.Login.TermsOfServiceDecline, style: .cancel, handler: { [weak self] _ in
                self?.termsOfServiceDeclined()
            }))
        } else {
            controller.addAction(UIAlertAction(title: L.Common.OK, style: .default, handler: nil))
        }
        
        present(controller, animated: true, completion: nil)
    }
    
    private func termsOfServiceDeclined() {
        let controller = UIAlertController(title: L.Login.TermsOfServiceDecline, message: L.Login.TermsOfServiceSignupDecline, preferredStyle: .alert)
        
        controller.addAction(UIAlertAction(title: L.Login.TermsOfServiceDecline, style: .cancel, handler: { [weak self] _ in
            self?.cancelButtonTapped()
        }))
        
        controller.addAction(UIAlertAction(title: L.Common.Cancel, style: .default, handler: { [weak self] _ in
            self?.showTermsOfService(ifNecessarily: true)
        }))
        
        present(controller, animated: true, completion: nil)
    }

}

// MARK: - TDAuthorizerDelegate

extension AuthorizationViewController: TDAuthorizerDelegate {
    func authorizerDidStartAuthorization(_ authorizer: TDAuthorizerSession) {
        self.authorizer = authorizer
    }
    
    func authorizer(_ authorizer: TDAuthorizerSession, didReceivePreferred countryCode: String) {
        
    }
    
    func authorizerRequestsPhoneNumber(_ authorizer: TDAuthorizerSession) {
        if phoneEntryViewController != nil {
            return
        }

        CountryManager.load { [weak self] countryManager in
            guard let self = self else { return }
            
            
            let controller = PhoneEntryViewController(countryManager: countryManager)
            
            self.countryManager = countryManager
            self.phoneEntryViewController = controller
            
//            let codeInfo = TDObject.AuthenticationCodeInfo(phoneNumber: "380957965942", type: .telegramMessage(length: 5), nextType: .sms(length: 5), timeout: 60)
//            let codeInfo = TDObject.AuthenticationCodeInfo(phoneNumber: "380957965942", type: .sms(length: 5), nextType: .call(length: 5), timeout: 60)
            
//            let controller = CodeEntryViewController(codeInfo: codeInfo)
            
//            let controller = SignUpViewController(isTermsOfServiceAvailable: true)
            
            self.viewControllers = [controller]
        }
    }
    
    func authorizer(_ authorizer: TDAuthorizerSession, requestsAuthCodeWith codeInfo: TDObject.AuthenticationCodeInfo, isRegistered: Bool, termsOfService: TDObject.TermsOfService?) {
        self.termsOfService = termsOfService
        
        let controller = CodeEntryViewController(codeInfo: codeInfo)
        
        pushViewController(controller, animated: true)
    }
    
    func authorizer(_ authorizer: TDAuthorizerSession, requestsPasswordWith hint: String?) {
        let controller = PasswordEntryViewController(passwordHint: hint)
        
        pushViewController(controller, animated: true)
    }
    
    func authorizer(_ authorizer: TDAuthorizerSession, requestsPasswordRecoveryCodeWith emailPattern: String) {
        let controller = PasswordRecoveryViewController(recoveryEmailPattern: emailPattern)
        
        pushViewController(controller, animated: true)
    }
    
    func authorizerRequestsSignUp(_ authorizer: TDAuthorizerSession) {
        let controller = SignUpViewController(isTermsOfServiceAvailable: termsOfService != nil)
        
        pushViewController(controller, animated: true)
        
        // while alert is presented we are not allowed to push =(
        DispatchQueue.main.async {
            self.showTermsOfService(ifNecessarily: true)
        }
    }
    
    func authorizer(_ authorizer: TDAuthorizerSession, didCompleteWithError error: TDAuthorizationError?) {
        if isDismissed {
            return
        }
        
        isDismissed = true
        
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - UINavigationControllerDelegate

extension AuthorizationViewController: UINavigationBarDelegate {
    func navigationBar(_ navigationBar: UINavigationBar, shouldPop item: UINavigationItem) -> Bool {
        guard shouldHandlePop else {
            shouldHandlePop = true
            return true
        }
        
        let controller = UIAlertController(title: nil, message: L.Login.CancelPhoneVerification, preferredStyle: .alert)
        
        controller.addAction(UIAlertAction(title: L.Login.CancelPhoneVerificationContinue, style: .cancel, handler: nil))
        
        controller.addAction(UIAlertAction(title: L.Login.CancelPhoneVerificationStop, style: .default, handler: { [weak self] _ in
            self?.reset()
        }))
        
        present(controller, animated: true, completion: nil)
        
        return false
    }
}
