//
//  ViewController.swift
//  Swiftygram Example
//
//  Created by KY1VSTAR on 5/16/19.
//  Copyright © 2019 KY1VSTAR. All rights reserved.
//

import UIKit
import Swiftygram

class ViewController: UIViewController {
    
    var authorizationFlow: TDAuthorizationFlow?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let configuration = TDAuthorizerConfiguration(apiId: 110110,
                                  apiHash: "2e4f47c07d66d4461943d47f4f18a555",
                                  usesTestEnvironment: true,
                                  appGroupId: nil)

        authorizationFlow = TDAuthorizer.authorization(with: configuration, delegate: self, completion: { result in

        })
    }

}

extension ViewController: TDAuthorizerDelegate {
    func authorizer(_ authorizer: TDAuthorizerSession, didReceivePreferred countryCode: String) {
        print(countryCode)
    }
    
    func authorizerRequestsPhoneNumber(_ authorizer: TDAuthorizerSession) {
        authorizer.setPhoneNumber("380986570880", completionHandler: nil)
    }
    
    func authorizer(_ authorizer: TDAuthorizerSession, requestsAuthCodeWith codeInfo: TDObject.AuthenticationCodeInfo, isRegistered: Bool, termsOfService: TDObject.TermsOfService?) {
        if case .telegramMessage = codeInfo.type {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 121) {
                authorizer.resendAuthCode(with: nil)
//            }
            
            return
        }
        
        let controller = UIAlertController(title: "Code", message: nil, preferredStyle: .alert)
        
        controller.addTextField { textField in
            textField.keyboardType = .numberPad
        }
        
        controller.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [weak controller] _ in
            guard let text = controller?.textFields?.first?.text else {
                return
            }
            
            authorizer.setAuthCode(text, completionHandler: nil)
        }))
        
        controller.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(controller, animated: true, completion: nil)
    }
    
    func authorizerRequestsUsername(_ authorizer: TDAuthorizerSession) {
        authorizer.setFirstName("Alex", lastName: "Test", completionHandler: nil)
    }
    
    func authorizerDidCancelAuthorizationFlow(_ authorizer: TDAuthorizerSession) {
        
    }
    
    
}

