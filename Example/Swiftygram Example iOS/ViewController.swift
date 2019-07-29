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
    }
    
    @IBAction func authorizeButtonTapped() {
        let configuration = TDAuthorizerConfiguration(apiId: 110110,
                                                      apiHash: "2e4f47c07d66d4461943d47f4f18a555",
                                                      usesTestEnvironment: true,
                                                      appGroupId: nil)
        
        authorizationFlow = TDAuthorizer.authorization(with: configuration, presentingViewController: self, completion: { result in

        })
//
//        let controller = Test2ViewController()
//
//        navigationController!.pushViewController(controller, animated: true)
    }

}
