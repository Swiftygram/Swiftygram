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
    
    var authorizer: TDAuthorizer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let configuration = TDAuthorizerConfiguration(apiId: 110110,
                                  apiHash: "2e4f47c07d66d4461943d47f4f18a555",
                                  usesTestEnvironment: false,
                                  appGroupId: nil)

        authorizer = TDAuthorizer.authorization(with: configuration, delegate: self, completion: { result in

        })
    }

}

extension ViewController: TDAuthorizerDelegate {
    
}

