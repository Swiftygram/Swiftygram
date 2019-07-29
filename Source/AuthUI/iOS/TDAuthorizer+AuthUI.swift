//
//  TDAuthorizer+AuthUI.swift
//  Swiftygram.default-AuthUI
//
//  Created by Oleksandr Zhuhan on 7/29/19.
//

import Foundation

public extension TDAuthorizer {
    class func authorization(with configuration: TDAuthorizerConfiguration, presentingViewController: UIViewController, completion: @escaping TDAuthorizationResultHandler) -> TDAuthorizationFlow {
        let controller = AuthorizationViewController()
        
        presentingViewController.present(controller, animated: true, completion: nil)
        
        return TDInternalAuthorizer(configuration: configuration, delegate: controller, completion: completion)
    }
}
