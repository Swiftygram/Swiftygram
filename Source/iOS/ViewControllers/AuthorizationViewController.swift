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
    
    private var preferredCountryCode: String?
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()

        showLoadingViewController()
    }
    
    private func setupNavigationBar() {
        navigationBar.isTranslucent = false
        navigationBar.barTintColor = .white
        navigationBar.shadowImage = UIImage()
    }
    
    private func showLoadingViewController() {
        let controller = AuthorizationBaseViewController<UIView?>(contentView: nil, isFinalStep: false)
        controller.isProcessing = true
        controller.title = "Telegram"
        
        viewControllers = [controller]
    }
    
    func cancelButtonTapped() {
        dismiss(animated: true, completion: nil)
    }

}

// MARK: - TDAuthorizerDelegate

extension AuthorizationViewController: TDAuthorizerDelegate {
    func authorizer(_ authorizer: TDAuthorizerSession, didReceivePreferred countryCode: String) {
        
    }
    
    func authorizerRequestsPhoneNumber(_ authorizer: TDAuthorizerSession) {
        if phoneEntryViewController != nil {
            return
        }
        
        CountryManager.load { [weak self] countryManager in
            guard let self = self else { return }
            
//            let controller = PhoneEntryViewController(countryManager: countryManager, authorizerSession: authorizer)
//            self.phoneEntryViewController = controller
            let controller = CodeEntryViewController()
            
            self.viewControllers = [controller]
        }
    }
    
    func authorizer(_ authorizer: TDAuthorizerSession, requestsAuthCodeWith codeInfo: TDObject.AuthenticationCodeInfo, isRegistered: Bool, termsOfService: TDObject.TermsOfService?) {
        
    }
    
    func authorizerRequestsUsername(_ authorizer: TDAuthorizerSession) {
        
    }
    
    public func authorizerDidCancelAuthorizationFlow(_ authorizer: TDAuthorizerSession) {
        
    }
}

// MARK: - UINavigationControllerDelegate

extension AuthorizationViewController: UINavigationControllerDelegate {
    
    
    
}
